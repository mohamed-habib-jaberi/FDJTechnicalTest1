//
//  Constants.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

enum Constants {
    
    enum Networking {
        static let apiKeyNotValid = "Access Unauthorized"
        static let apiKey = "50130162"
        static let baseURL = "https://www.thesportsdb.com/api/v1/json/"
    }
    
    enum EndpointPath {
        static let league = "/all_leagues.php"
        static let team = "/search_all_teams.php?l=French%20Ligue%201"
    }
}

