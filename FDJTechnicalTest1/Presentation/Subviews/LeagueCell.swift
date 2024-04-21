//
//  LeagueCell.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import SwiftUI

struct LeagueCell: View {
    let league: League
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(league.strLeague ?? Constants.Strings.emptyString)
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text("Sport: \(league.strSport ?? Constants.Strings.emptyString)")
                    .font(.subheadline)
                
                Text("Alternate Name: \(league.strLeagueAlternate ?? Constants.Strings.emptyString)")
                    .font(.subheadline)
            }
            .padding()            
            Spacer() // Expand the cell to fill available space
        }
        .padding(.horizontal, 16) // Add horizontal padding
    }
}

struct LeagueCell_Previews: PreviewProvider {
    static var previews: some View {
        LeagueCell(league: LeaguesMock.league)
    }
}
