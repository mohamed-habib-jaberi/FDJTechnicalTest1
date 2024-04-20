//
//  TeamsRepositoryImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

class TeamsRepositoryImpl: TeamsRepository {

    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkServiceImpl()) {
        self.networkService = networkService
    }
    
    func getTeamsList(strLeague: String) async throws -> [Team] {
        let baseURL = BaseURL.Networking.url
        let endpoint = strLeague.buildTeamSearchURL()
        
        let teamsListDTO: TeamsDTO = try await self.networkService.request(baseURL: baseURL, endpoint: endpoint)
                return teamsListDTO.toDomain()
    }
}
