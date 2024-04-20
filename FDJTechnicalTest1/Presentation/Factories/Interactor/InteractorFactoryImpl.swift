//
//  InteractorFactoryImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

final class InteractorFactoryImpl {
    let repositoryFactory: RepositoryFactory
    
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }
}

extension InteractorFactoryImpl: LeaguesInteractorFactory {
    func makeLeaguesInteractor() -> LeaguesInteractor {
        return LeaguesInteractorImpl(leagueRepository: repositoryFactory.makeLeagueRepository())
    }
}

extension InteractorFactoryImpl: TeamsInteractorFactory {
    func makeTeamsInteractor() -> TeamsInteractor {
        return TeamsInteractorImpl(teamsRepository: repositoryFactory.makeTeamsRepository())
    }
}
