//
//  LeaguesInteractorImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

class LeaguesInteractorImpl: LeaguesInteractor {
   
    private let repository: LeagueRepository
    
    init(leagueRepository: LeagueRepository) {
        self.repository = leagueRepository
    }
    
    func getLeaguesList() async throws -> [League] {
        return try await repository.getLeaguesList()
    }
    
    func getTeamsList(strLeague: String) async throws -> [Team] {
        return try await repository.getTeamsList(strLeague: strLeague)
    }
}

