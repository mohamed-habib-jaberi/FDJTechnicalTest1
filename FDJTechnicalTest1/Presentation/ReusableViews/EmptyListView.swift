//
//  EmptyListView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import SwiftUI

struct EmptyListView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "list.bullet")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("No Items Found")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            
            Text("There are currently no items available.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
