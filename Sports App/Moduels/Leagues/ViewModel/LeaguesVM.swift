//
//  LeaguesVM.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation
class LeagueViewModel
{
    
    var sportName :String!
    var url :String!
    var leagues:[Countries]?{
        didSet{
            bindingResult()
        }
    }
    
    var bindingResult: (()->()) = {}
    
    
    init(sportName:String?) {
        self.sportName = sportName
   
      
    }
    
    func getData() -> Void {
        let url  = Constants.getLeaguesBySport_URL() + sportName
         
        BaseAPI.Get(strURL: url, paramaters: nil, headers: nil) {[weak self] (status, response:AllLegaues?) in
            if status != 1 {
                print("erorr")
            }else{
                guard let result = response else {return}
                self?.leagues = result.countries
            }
        }
        
    }
    
}
