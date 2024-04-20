//
//  LeagueListDTO.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct LeagueListDTO: Decodable {
    var leagues: [LeagueDTO] = [LeagueDTO]()
}

extension LeagueListDTO {
    func toDomain() -> [League] {
        return leagues.map { $0.toDomain() }
    }
}
