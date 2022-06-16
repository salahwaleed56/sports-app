//
//  Constants.swift
//  Sports App
//
//  Created by salah waleed on 13/06/2022.
//

import UIKit

final class Constants {
    // to calculate screeen heigh and width
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    //Api Consts
    private static let domain = "https://www.thesportsdb.com/api/v1/json/2"
    private static let Sports_url = "/all_sports.php"
    private static let leaguesBySport_URL = "/search_all_leagues.php?s="
    private static let teamsByLegaue_URL = "/search_all_teams.php?l="
    private static let eventsByLeague = "/eventsseason.php?id="
    
    class func getSports_URL() -> String {
        return Constants.domain + Constants.Sports_url
    }
    
    class func getLeaguesBySport_URL() -> String {
        return Constants.domain + Constants.leaguesBySport_URL
    }
    
    
    class func getTeamsByLegaue_URL() -> String {
        return Constants.domain + Constants.teamsByLegaue_URL
    }
    
    class func getEventsByLeague_URL() -> String {
        return Constants.domain + Constants.eventsByLeague
    }
    
}
