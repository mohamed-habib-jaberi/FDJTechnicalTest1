//
//  RepositoryFactory.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

typealias RepositoryFactory = LeaguesRepositoryFactory 

protocol LeaguesRepositoryFactory {
    func makeLeagueRepository() -> LeagueRepository
}
