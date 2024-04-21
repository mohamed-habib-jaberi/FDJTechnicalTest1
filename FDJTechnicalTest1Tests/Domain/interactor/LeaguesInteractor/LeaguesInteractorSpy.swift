//
//  LeaguesInteractorSpy.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
@testable import FDJTechnicalTest1

class LeaguesInteractorSpy {
    
    // MARK: - Properties
    
    var mockedLeagues: [League]?
    var getLeaguesCalled = false
}

extension LeaguesInteractorSpy: LeaguesInteractor {
    
    func getLeaguesList() async throws -> [League] {
        
        getLeaguesCalled = true
        
        if let model = mockedLeagues {
            return model
        } else {
            throw NSError(domain: "", code: -1)
        }
    }
}
