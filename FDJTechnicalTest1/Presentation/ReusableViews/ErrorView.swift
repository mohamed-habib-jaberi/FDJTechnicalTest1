//
//  ErrorView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import SwiftUI

struct ErrorView: View {
    var retryAction: () -> Void
        
        var body: some View {
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                
                Text("Error Occurred")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                Text("Oops! Something went wrong.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button(action: retryAction) {
                    Text("Retry")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(retryAction: {})
    }
}
