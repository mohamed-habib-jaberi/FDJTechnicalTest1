//
//  TeamsRepository.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol TeamsRepository {
    func getTeamsList(strLeague: String) async throws -> [Team]
}
