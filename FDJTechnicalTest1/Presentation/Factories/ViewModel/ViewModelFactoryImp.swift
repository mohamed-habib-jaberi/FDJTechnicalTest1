//
//  ViewModelFactoryImp.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation

final class ViewModelFactoryImp {
    let interactorFactory: InteractorFactoryImpl

    init(interactorFactory: InteractorFactoryImpl) {
        self.interactorFactory = interactorFactory
    }
    
    lazy var leaguesInteractor: LeaguesInteractor = {
        interactorFactory.makeLeaguesInteractor()
    }()
    
    lazy var teamsInteractor: TeamsInteractor = {
        interactorFactory.makeTeamsInteractor()
    }()
    
}

