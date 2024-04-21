//
//  LoaderView.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        
        ProgressView()
              .progressViewStyle(CircularProgressViewStyle(tint: .blue))
              .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
