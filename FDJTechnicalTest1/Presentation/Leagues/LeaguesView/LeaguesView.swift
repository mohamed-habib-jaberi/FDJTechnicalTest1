//
//  LeaguesView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import SwiftUI

struct LeaguesView: View {
    
    // MARK: Stored Properties
    @StateObject private var viewModel: LeaguesViewModel
    
    // MARK: Initialization
    init(viewModelFactory: LeaguesViewModelFactory) {
        _viewModel = StateObject(wrappedValue: viewModelFactory.makeLeaguesViewModel())
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct LeaguesView_Previews: PreviewProvider {
    
    static var previews: some View {

        let repositoryFactory = RepositoryFactoryImpl()
        let interactorFactory = InteractorFactoryImpl(repositoryFactory: repositoryFactory)
        let viewModelFactory = ViewModelFactoryImp(interactorFactory: interactorFactory)
        let leaguesViewModel = viewModelFactory.makeLeaguesViewModel()
        
        LeaguesView(viewModelFactory: leaguesViewModel as LeaguesViewModelFactory )
    }
}
