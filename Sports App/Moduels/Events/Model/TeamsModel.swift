//
//  TeamsModel.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation


struct AllTeams:Codable {
  var  teams :[Teams]
}

struct Teams: Codable {
    var idTeam:String?
    var strTeam:String?
    var strTeamShort:String?
    var strAlternate:String?
    var intFormedYear:String?
    var strLeague:String?
    var strStadium:String?
    var strTeamBadge:String?
    var strStadiumThumb:String?
    var intStadiumCapacity:String?
    var strWebsite:String?
    var strFacebook:String?
    var strTwitter:String?
    var strInstagram:String?
    var strYoutube:String?
    var strCountry:String?
    
 
}
 
 
