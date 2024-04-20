//
//  RepositoryFactory.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

typealias RepositoryFactory = LeaguesRepositoryFactory & TeamsRepositoryFactory

protocol LeaguesRepositoryFactory {
    func makeLeagueRepository() -> LeagueRepository
}

protocol TeamsRepositoryFactory {
    func makeTeamsRepository() -> TeamsRepository
}

