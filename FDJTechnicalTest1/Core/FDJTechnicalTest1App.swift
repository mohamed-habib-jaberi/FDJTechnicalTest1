//
//  FDJTechnicalTest1App.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import SwiftUI

@main
struct FDJTechnicalTest1App: App {
        
    var body: some Scene {
        WindowGroup {
            
            let repositoryFactory = RepositoryFactoryImpl()
            let interactorFactory = InteractorFactoryImpl(repositoryFactory: repositoryFactory)
            let viewModelFactory = ViewModelFactoryImp(interactorFactory: interactorFactory)
            let leaguesViewModel = viewModelFactory.makeLeaguesViewModel()
            
            LeaguesView(viewModelFactory: leaguesViewModel as LeaguesViewModelFactory )
        }
    }
}
