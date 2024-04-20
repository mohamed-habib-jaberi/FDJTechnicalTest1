//
//  Leagues.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation
 
struct LeaguesResponse: Decodable {
    let leagues: [League]
}

struct League: Decodable, Hashable {
    let idLeague: String
    let strLeague: String
    let strSport: String
    let strLeagueAlternate: String
   
    
    init(idLeague: String, strLeague: String, strSport: String, strLeagueAlternate: String ) {
        self.idLeague = idLeague
        self.strLeague = strLeague
        self.strSport = strSport
        self.strLeagueAlternate = strLeagueAlternate
    }
}
