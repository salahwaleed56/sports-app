//
//  LeaguesModel.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation

struct AllLegaues: Codable {
    var countries : [Countries]?
}

struct Countries: Codable {
    var idLeague: String?
    var strSport: String?
    var strLeague: String?
    var strCurrentSeason: String?
    var strYoutube: String?
    var strBadge: String?
    var strLogo:String?
}

 
