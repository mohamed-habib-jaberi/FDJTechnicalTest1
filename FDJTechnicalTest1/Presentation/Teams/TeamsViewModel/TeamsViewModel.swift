//
//  TeamsViewModel.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation
import Combine

enum TeamsScreenStatus {
    case onError
    case isLoading
    case hasTeams
    case emptyTeams
}

final class TeamsViewModel: ObservableObject, TeamsViewModelFactory {
    
    
    
    // MARK: - Constructor properties
    private let teamsInteractor: TeamsInteractor
    
    @Published var teams: [Team] = []
    @Published var status: TeamsScreenStatus = .isLoading
    
   
    var navTitle: String = "Teams"
    
    // MARK: - Initialization
    init(teamsInteractor: TeamsInteractor ) {
        self.teamsInteractor = teamsInteractor
    }
    
    func makeTeamsViewModel() -> TeamsViewModel {
        return .init(teamsInteractor: self.teamsInteractor)
    }
    
    @MainActor
    func loadTeams() async {
        do {
            status = .isLoading
           
            teams = try await teamsInteractor.getTeamsList(strLeague: "le")
               
            status = teams.isEmpty ? .emptyTeams : .hasTeams
        } catch {
            status = .onError
        }
    }
}
