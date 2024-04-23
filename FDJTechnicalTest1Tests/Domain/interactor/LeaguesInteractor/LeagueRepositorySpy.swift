//
//  LeagueRepositorySpy.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
@testable import FDJTechnicalTest1

final class LeagueRepositorySpy {
    
    // MARK: - Properties
    var getLeaguesCalled = false
    var mockedLeagues: [League]?
    
    var getTeamsCalled = false
    var mockedTeams: [Team]?
}

extension LeagueRepositorySpy: LeagueRepository {
    
    func getLeaguesList() async throws -> [League] {
        getLeaguesCalled = true
        if let leagues = mockedLeagues {
            return leagues
        } else {
            throw NSError(domain: "", code: -1)
        }
    }
    
    func getTeamsList(strLeague: String) async throws -> [Team] {
        
        getTeamsCalled = true
        if let teams = mockedTeams {
            return teams
        } else {
            throw NSError(domain: "", code: -1)
        }
    }
}
