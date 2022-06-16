//
//  EventsModel.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation

struct AllEvents:Codable {
    var events:[Event]
}

struct Event:Codable {
    var idEvent:String?
    var strEvent:String?
    var strSport:String?
    var idLeague:String?
    var strLeague:String?
    var strSeason:String?
    var strHomeTeam:String?
    var strAwayTeam:String?
    var intHomeScore:String?
    var intAwayScore:String?
    var dateEvent:String?
    var strTime:String?
    var strVenue:String?
    var strThumb:String?
    var strStatus:String?
 
}




 
