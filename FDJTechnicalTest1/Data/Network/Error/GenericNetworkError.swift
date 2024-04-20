//
//  GenericNetworkError.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

enum GenericNetworkErrorKeys: String {
    case leagueNotExist = "LEAGUE_NOT_EXIST"
    case teamsNotExist = "TEAM_NOT_EXIST"
    case other
}

public struct GenericNetworkError: Equatable {
    let type: String?
    let title: String?
    let status: Int?
    let detail: String?
    let key: GenericNetworkErrorKeys
}

