//
//  RepositoryFactoryImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

final class RepositoryFactoryImpl: LeaguesRepositoryFactory {
    func makeLeagueRepository() -> LeagueRepository {
        return LeagueRepositoryImpl()
    }
}
