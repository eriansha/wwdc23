//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        VStack {
            Text("How to Play")
                .font(.system(size: 70))
            
            NavigationLink {
                InstrumentView()
            } label: {
                Text("Play")
                    .font(.largeTitle)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 30)
            }.buttonStyle(.bordered)
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
