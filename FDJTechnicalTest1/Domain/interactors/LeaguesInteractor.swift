//
//  LeaguesInteractor.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

protocol LeaguesInteractor {
    func getLeaguesList() async throws -> [League]
}
