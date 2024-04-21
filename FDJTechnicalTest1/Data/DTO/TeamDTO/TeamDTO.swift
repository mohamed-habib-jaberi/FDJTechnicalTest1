//
//  TeamDTO.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct TeamDTO: Decodable {
    let idTeam: String
    let strTeam: String?
    let strTeamShort: String?
    let strLeague: String?
    let strTeamLogo: String?
}

extension TeamDTO {
    func toDomain() -> Team {
        return .init(idTeam: idTeam, strTeam: strTeam, strTeamShort: strTeamShort, strLeague: strLeague, strTeamLogo: strTeamLogo)
    }
}
