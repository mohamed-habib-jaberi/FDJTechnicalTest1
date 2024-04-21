//
//  LeaguesView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import SwiftUI

struct LeaguesView: View {
    
    @State private var searchText = ""
    
    // MARK: Stored Properties
    @StateObject private var viewModel: LeaguesViewModel
    
    // MARK: Initialization
    init(viewModelFactory: LeaguesViewModelFactory) {
        _viewModel = StateObject(wrappedValue: viewModelFactory.makeLeaguesViewModel())
    }
    
    var body: some View {
        VStack {
            
            
            switch viewModel.status {
            case .isLoading:
                LoaderView()
                
            case .hasLeagues:
                hasLeagues
                
            case .emptyLeagues:
                EmptyListView()
                
            case .onError:
                ErrorView(retryAction: { [weak viewModel] in
                    Task {
                        await viewModel?.loadLeagues()
                    }
                })
            }
            
        }
        //.searchable(text: $searchText)
        .onViewDidLoad {
            Task { [weak viewModel] in
                await viewModel?.loadLeagues()
            }
        }
    }
    
    @ViewBuilder
    private var hasLeagues: some View {
        LeagueListView(leagues: viewModel.leagues)
            .searchable(text: $searchText)
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
