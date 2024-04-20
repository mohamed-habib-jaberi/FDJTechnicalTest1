//
//  ViewModelFactory.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
import SwiftUI

protocol LeaguesViewModelFactory {
    func makeLeaguesViewModel() -> LeaguesViewModel
}

protocol TeamsViewModelFactory {
    func makeTeamsViewModel() -> TeamsViewModel
}

extension ViewModelFactoryImp: LeaguesViewModelFactory {
    func makeLeaguesViewModel() -> LeaguesViewModel {
        return .init(leaguesInteractor: self.leaguesInteractor)
    }
}

extension ViewModelFactoryImp: TeamsViewModelFactory {
    func makeTeamsViewModel() -> TeamsViewModel {
        return .init(teamsInteractor: self.teamsInteractor)
    }
}
