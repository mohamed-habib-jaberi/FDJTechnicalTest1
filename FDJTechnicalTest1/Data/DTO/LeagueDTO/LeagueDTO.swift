//
//  LeagueDTO.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct LeagueDTO: Decodable {
    let idLeague: String
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
}

extension LeagueDTO {
    func toDomain() -> League {
        return .init(idLeague: idLeague, strLeague: strLeague, strSport: strSport, strLeagueAlternate: strLeagueAlternate)
    }
}

