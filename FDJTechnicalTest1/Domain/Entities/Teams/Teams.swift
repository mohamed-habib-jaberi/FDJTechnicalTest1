//
//  Teams.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct TeamsResponse: Decodable {
    let teams: [Team]?
}

struct Team: Decodable, Hashable {
    let idTeam: String
    let strTeam: String?
    let strTeamShort: String?
    let strLeague: String?
    let strTeamBadge: String?
   
    init(idTeam: String, strTeam: String?, strTeamShort: String?, strLeague: String?, strTeamBadge: String? ) {
        self.idTeam = idTeam
        self.strTeam = strTeam
        self.strTeamShort = strTeamShort
        self.strLeague = strLeague
        self.strTeamBadge = strTeamBadge
    }
}
