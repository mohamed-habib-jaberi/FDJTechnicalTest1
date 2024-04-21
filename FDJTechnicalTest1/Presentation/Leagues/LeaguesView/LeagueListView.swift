//
//  LeagueListView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import SwiftUI

struct LeagueListView: View {
    let leagues: [League]
    
    var body: some View {
        List(leagues, id: \.idLeague) { league in
            LeagueCell(league: league)
                .padding(.horizontal, 0.0)
        }
        .navigationTitle("Leagues")
    }
}

struct LeagueListView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueListView(leagues: LeaguesMock.leaguesList)
    }
}
