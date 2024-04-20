//
//  TeamsInteractorImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

class TeamsInteractorImpl: TeamsInteractor {

    private let repository: TeamsRepository
    
    init(teamsRepository: TeamsRepository) {
        self.repository = teamsRepository
    }
    
    func getTeamsList(strLeague: String) async throws -> [Team] {
        return try await repository.getTeamsList(strLeague: strLeague)
    }
}
