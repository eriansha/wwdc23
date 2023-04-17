//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

struct InstructionView: View {
    @State private var isDisabled: Bool = true
    @State private var isRotate: Bool = false
    @State private var orientation = UIDeviceOrientation.unknown
    
    let paragraphs: [String] = [
        "To start the game, simply tap on the Angklung instrument that appears on the screen. The instrument will produce a specific tone each time you tap on it.",
        "Try to tap Angklung below!"
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("How to Play")
                    .font(.system(size: 90))
                    .foregroundColor(textColor)
                    .bold()
                
                VStack(alignment: .leading) {
                    ForEach(paragraphs, id: \.self) { paragraph in
                        Text(paragraph)
                            .font(.largeTitle)
                            .foregroundColor(textColor)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.bottom, 30)
                .frame(maxWidth: 900)
                
                AngklungView(
                    soundPath: "1_do",
                    imagePath: "angklungDo",
                    ratio: 1
                )
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            self.isDisabled = false
                        }
                )
                
                NavigationLink {
                    InstrumentView()
                } label: {
                    Text("Let's Play")
                        .font(.largeTitle)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                }
                .disabled(isDisabled)
                .buttonStyle(.bordered)
                .background(
                    !isDisabled ? primaryButtonColor : .clear
                )
                .cornerRadius(8)
            }
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
