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

extension ViewModelFactoryImp: LeaguesViewModelFactory {
    func makeLeaguesViewModel() -> LeaguesViewModel {
        return .init(leaguesInteractor: self.leaguesInteractor)
    }
}
