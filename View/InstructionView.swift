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
        "To play the Angklung, you need to hold the instrument by the frame and shake it. The musician usually holds several tubes in each hand, and by shaking them in different combinations, melodies can be created. To play a melody, you need to coordinate with other musicians and play your part at the right time."
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
                .frame(maxWidth: orientation.isLandscape ? 1000 : 700)
                
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
