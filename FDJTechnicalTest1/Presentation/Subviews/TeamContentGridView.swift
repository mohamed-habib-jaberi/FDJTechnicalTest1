//
//  ContentView2.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 22/04/2024.
//

import SwiftUI
import URLImage

struct TeamContentGridView: View {
    
    @State private var searchText = ""
    
    @State var teams: [Team]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())] // Two flexible columns
    
    var body: some View {
        NavigationView {
            List {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(teams, id: \.idTeam) { team in
                        
                        URLImage(URL(string: team.strTeamBadge ?? "photo" )!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                        }
                        
                        
                    }
                }
                .background(Color.clear)
            }
            .navigationTitle(Constants.Strings.navTitle)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        TeamContentGridView(teams: TeamsMock.teams)
    }
}
