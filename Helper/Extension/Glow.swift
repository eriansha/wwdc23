//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 17/04/23.
//

import SwiftUI

extension View {
    func glow(color: Color = .yellow, radius: CGFloat = 20) -> some View {
        self.shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
