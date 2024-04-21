//
//  TeamsRepositorySpy.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
@testable import FDJTechnicalTest1

final class TeamsRepositorySpy {
    
    // MARK: - Properties
    var getTeamsCalled = false
    var mockedTeams: [Team]?
    
}

extension TeamsRepositorySpy: TeamsRepository {
    func getTeamsList(strLeague: String) async throws -> [Team] {
        
        getTeamsCalled = true
        if let teams = mockedTeams {
            return teams
        } else {
            throw NSError(domain: "", code: -1)
        }
    }
}

