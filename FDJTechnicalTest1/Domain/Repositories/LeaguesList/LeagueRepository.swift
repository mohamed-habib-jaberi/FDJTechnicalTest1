//
//  LeagueRepository.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol LeagueRepository {
    func getLeaguesList() async throws -> [League]
    func getTeamsList(strLeague: String) async throws -> [Team]
}
