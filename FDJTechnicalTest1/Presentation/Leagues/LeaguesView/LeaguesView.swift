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
                    guard let viewModel = viewModel else { return }
                    Task {
                        await viewModel.loadLeagues()
                    }
                })
            }
            
        }
        .onViewDidLoad {
            Task { [weak viewModel] in
                guard let viewModel = viewModel else { return }
                await viewModel.loadTeams(searchText: viewModel.searchText )
            }
        }
        .onChange(of: viewModel.searchText) { searchText in
            Task { 
                
                guard !searchText.isEmpty else {
                    viewModel.teams = [] // Clear the teams list
                    viewModel.filterLeagues() // Update filtered leagues
                    return
                }
                
                viewModel.searchTextPublisher
                    .sink { searchText in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            Task {
                                await viewModel.loadTeams(searchText: searchText)
                            }
                        }
                    }
                    .store(in: &viewModel.cancellables)
                
                viewModel.searchText = searchText // Update searchTextPublisher
            }
            viewModel.filterLeagues()
        }
    }
    
    @ViewBuilder
    private var hasLeagues: some View {
        TeamContentGridView(teams: viewModel.filteredLeagues)
            .searchable(text: $viewModel.searchText)
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
