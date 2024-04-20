//
//  TeamsDTO.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct TeamsDTO: Decodable {
    var teams: [TeamDTO] = [TeamDTO]()
}

extension TeamsDTO {
    func toDomain() -> [Team] {
        return teams.map { $0.toDomain() }
    }
}
