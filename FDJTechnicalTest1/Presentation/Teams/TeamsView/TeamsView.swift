//
//  TeamsView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import SwiftUI

struct TeamsView: View {
    
    // MARK: Stored Properties
    @StateObject private var viewModel: TeamsViewModel
    
    // MARK: Initialization
    init(viewModelFactory: TeamsViewModelFactory) {
        _viewModel = StateObject(wrappedValue: viewModelFactory.makeTeamsViewModel())
    }
    
    var body: some View {
        
        switch viewModel.status {
        case .isLoading:
            LoaderView()

        case .hasTeams:
            EmptyView()
         
        case .emptyTeams:
            EmptyListView()
            
        case .onError:
            ErrorView(retryAction: { [weak viewModel] in
                Task {
                    await viewModel?.loadTeams()
                }
            })
        }
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {

        let repositoryFactory = RepositoryFactoryImpl()
        let interactorFactory = InteractorFactoryImpl(repositoryFactory: repositoryFactory)
        let viewModelFactory = ViewModelFactoryImp(interactorFactory: interactorFactory)
        let teamsViewModel = viewModelFactory.makeLeaguesViewModel()

        TeamsView(viewModelFactory: teamsViewModel as! TeamsViewModelFactory)
    }
}
