//
//  ViewDidLoadModifier.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !viewDidLoad {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
