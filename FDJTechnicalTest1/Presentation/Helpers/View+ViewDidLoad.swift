//
//  View+ViewDidLoad.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 21/04/2024.
//

import Foundation
import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
