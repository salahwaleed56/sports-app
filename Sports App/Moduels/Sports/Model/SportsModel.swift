//
//  SportsModel.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import Foundation

struct AllSports: Codable {
    var sports: [Sport]?
}

// MARK: - Sport
struct Sport: Codable {
    var idSport, strSport: String?
    var strFormat: StrFormat?
    var strSportThumb: String?
    var strSportIconGreen: String?
    var strSportDescription: String?
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
