//
//  EventVM.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation
class EventViewModel {
    
    var eventsResult:[Event]?
    var idLeague:String
    var strLeague:String
    var league:Countries
    var teams:[Teams]?{
        didSet {
            bindingResultTeams()
        }
    }
    var upComming:[Event]?{
        didSet{
            bindingResultevents()
        }
    }
    var bindingResultevents : (()->()) = {}
    var bindingResultTeams : (()->()) = {}
    init(idLeague:String,strLeague:String,league:Countries) {
        self.idLeague = idLeague
        self.strLeague = strLeague
        self.league = league
        print(idLeague)
    }
    func addToCoreData(){
        CoreDataManager.shared.add(league: league)
        
    }
    
    func getData(){
        DispatchQueue.global().async {   
             
            let url  = Constants.getEventsByLeague_URL() + self.idLeague
             
            BaseAPI.Get(strURL: url, paramaters: nil, headers: nil) {[weak self] (status, response:AllEvents?) in
                if status != 1 {
                    print("erorr")
                }else{
                    guard let result = response else {return}
                    self?.eventsResult = result.events
                    
                    let formatter = DateFormatter()
                    formatter.locale = Locale(identifier: "en_US_POSIX")
                    formatter.dateFormat = "yyyy-MM-dd"
                    let filterdResponse = result.events.filter { formatter.date(from:($0.dateEvent)!) ?? Date()  > Date()}
                    self?.upComming = filterdResponse
                    print(self?.upComming ?? "empty")
                }
            }
        }
    }
    
    func getTeams(){
        DispatchQueue.global().async {
            let url = Constants.getTeamsByLegaue_URL() + self.strLeague
            BaseAPI.Get(strURL: url, paramaters: nil, headers: nil) {[weak self] (status, response:AllTeams?) in
                if status != 1 {
                    print("erorr")
                }else{
                    guard let result = response else {return}
                    self?.teams = result.teams
                }
            }
        }
    }
    
    
}
