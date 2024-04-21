//
//  ViewFactory.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation

protocol LeaguesViewFactory {
    func makeLeaguesView() -> LeaguesView
}

protocol TeamsViewFactory {
    func makeTeamsView() -> TeamsView
}
