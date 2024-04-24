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
    @Published var teams: [Team] = []
    @Published var status: LeaguesScreenStatus = .isLoading

    @Published var searchTextPublisher = PassthroughSubject<String, Never>()
    @Published var searchText = Constants.Strings.emptyString {
        didSet {
            searchTextPublisher.send(searchText)
        }
    }

    @Published private(set) var filteredTeamsByLeague: [Team] = []

     var cancellables = Set<AnyCancellable>()

    var navTitle: String = Constants.Strings.navTitle

    // MARK: - Initialization
    init(leaguesInteractor: LeaguesInteractor ) {
        self.leaguesInteractor = leaguesInteractor

        Task { [weak self] in
            guard let self = self else { return }
            await self.loadLeagues()
        }
    }

    func makeLeaguesViewModel() -> LeaguesViewModel {
        return .init(leaguesInteractor: self.leaguesInteractor)
    }
    
    func filterTeamsbyLeagueName() -> [Team] {
        if searchText.isEmpty {
            return teams
        } else {
            return teams.filter { team in
                if let strLeague = team.strLeague {
                    return strLeague.localizedCaseInsensitiveContains(searchText)
                } else {
                    return false
                }
            }
        }
    }

    func sortTeamsByReverseAlphaAndFilter() {
        filteredTeamsByLeague = filterTeamsbyLeagueName().sorted(by: { (team1, team2) in
            if let strTeam1 = team1.strTeam, let strTeam2 = team2.strTeam {
                return strTeam1 > strTeam2
            } else {
                return false
            }
        }).enumerated().compactMap { (index, team) in
            index % 2 == 0 ? team : nil
        }
    }


    @MainActor
    func loadLeagues() async {
        do {
            status = .isLoading

            leagues = try await leaguesInteractor.getLeaguesList()
            status = leagues.isEmpty ? .emptyLeagues : .hasLeagues
            sortTeamsByReverseAlphaAndFilter()
        } catch {
            status = .onError
        }
    }

    @MainActor
    func loadTeams(searchText: String) async {
        do {
            status = .isLoading

            teams = try await leaguesInteractor.getTeamsList(strLeague: searchText)

            status = teams.isEmpty ? .emptyLeagues : .hasLeagues
            sortTeamsByReverseAlphaAndFilter()
        } catch {
            status = .onError
        }
    }
}
