//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

struct InstructionView: View {
    @State private var isRotate: Bool = false
    @State private var orientation = UIDeviceOrientation.unknown
    
    let paragraphs: [String] = [
        "To start the game, simply tap on the Angklung instrument that appears on the screen. The instrument will produce a specific tone each time you tap on it.",
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
            
                Image("angklungDo")
                    .resizable()
                    .padding(.bottom, 50)
                    .rotationEffect(.degrees(isRotate ? -20 : 0))
                    .frame(width: 150, height: 300)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                            isRotate.toggle()
                        }
                    }
                
                NavigationLink {
                    InstrumentView()
                } label: {
                    Text("Let's Play")
                        .font(.largeTitle)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                }
                .buttonStyle(.bordered)
                .background(primaryButtonColor)
                .cornerRadius(8)
            }
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
