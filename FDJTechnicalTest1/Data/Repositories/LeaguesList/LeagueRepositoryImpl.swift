//
//  LeagueRepositoryImpl.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

class LeagueRepositoryImpl: LeagueRepository {

    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkServiceImpl()) {
        self.networkService = networkService
    }
    
    func getLeaguesList() async throws -> [League] {
        let baseURL = BaseURL.Networking.url
        let endpoint = APIEndpoints.apiLeague
        
        let leaguesListDTO: LeagueListDTO = try await self.networkService.request(baseURL: baseURL, endpoint: endpoint)
                return leaguesListDTO.toDomain()
    }
}
