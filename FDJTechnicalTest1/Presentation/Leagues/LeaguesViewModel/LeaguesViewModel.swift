//
//  LeaguesViewModel.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation
import Combine

enum LeaguesScreenStatus {
    case onError
    case isLoading
    case hasLeagues
    case emptyLeagues
}

final class LeaguesViewModel: ObservableObject, LeaguesViewModelFactory {
    
   
    // MARK: - Constructor properties
    private let leaguesInteractor: LeaguesInteractor
    
    @Published var leagues: [League] = []
    @Published var status: LeaguesScreenStatus = .hasLeagues
    
   
    var navTitle: String = "Leagues"
    
    // MARK: - Initialization
    init(leaguesInteractor: LeaguesInteractor ) {
        self.leaguesInteractor = leaguesInteractor

    }
    
    func makeLeaguesViewModel() -> LeaguesViewModel {
        return .init(leaguesInteractor: self.leaguesInteractor)
    }
    
    @MainActor
    func loadLeagues() async {
        do {
            status = .isLoading
            
            leagues = try await leaguesInteractor.getLeaguesList()
               
            status = leagues.isEmpty ? .emptyLeagues : .hasLeagues
        } catch {
            status = .onError
        }
    }
}
