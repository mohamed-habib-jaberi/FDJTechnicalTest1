//
//  ViewFactoryImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
import SwiftUI

final class ViewFactoryImp {
    
    let viewModelFactory: ViewModelFactoryImp
    
    init(viewModelFactory: ViewModelFactoryImp) {
        self.viewModelFactory = viewModelFactory
    }
}

extension ViewFactoryImp: LeaguesViewFactory {
    func makeLeaguesView() -> LeaguesView {
        return .init(viewModelFactory: viewModelFactory)
    }
}

extension ViewFactoryImp: TeamsViewFactory {
    func makeTeamsView() -> TeamsView {
        return .init(viewModelFactory: viewModelFactory)
    }
}
