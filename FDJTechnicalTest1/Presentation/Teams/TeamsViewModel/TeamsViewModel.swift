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
    case hasLeagues
    case emptyLeagues
}

final class TeamsViewModel: ObservableObject {
    
    // MARK: - Constructor properties
    private let teamsInteractor: TeamsInteractor
    
    // MARK: - Initialization
    init(teamsInteractor: TeamsInteractor ) {
        self.teamsInteractor = teamsInteractor
    }
}
