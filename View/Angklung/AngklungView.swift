//
//  AngklungItem.swift
//  Ngklung
//
//  Created by Ivan on 14/04/23.
//

import SwiftUI

struct AngklungView: View {
    public var soundPath: String
    public var imagePath: String
    public var ratio: Int
    public var notation: String = ""
    public var showGlowing: Bool = false
    
    @State private var opacityNotation: Double = 0.0
    @State private var offsetNotation: CGFloat = -200
    
    @State private var wiggleTogle = false
    @State private var offset = CGSize(width: 0, height: 0)
    
    var body: some View {
        ZStack {
            if !notation.isEmpty {
                Text(notation)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .opacity(opacityNotation)
                    .offset(x: 0, y: offsetNotation)
                    .onChange(of: wiggleTogle) { newValue in
                        if newValue {
                            self.offsetNotation = -200
                            
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.opacityNotation = 1.0
                                self.offsetNotation += 50
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.opacityNotation = 0.0
                                    self.offsetNotation -= 50
                                }
                            }
                        }
                    }
            }
            
            Image(imagePath)
                .resizable()
                .frame(
                    width: 100 - (5 * CGFloat(ratio)),
                    height: 200 - (10 * CGFloat(ratio))
                )
                .modifier(TiltingAnimation(isOn: wiggleTogle))
                .rotationEffect(.degrees(wiggleTogle ? 5 : 0))
                .offset(offset)
                .glow(color: .yellow, radius: showGlowing ? 36 : 0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        offset = CGSize(
                            width: -40,
                            height: -10
                        )
                        wiggleTogle.toggle()
                    }
                    
                    playSound(
                        sound: soundPath,
                        type: "mp3"
                    )
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        wiggleTogle.toggle()
                        withAnimation(.easeInOut(duration: 0.5)) {
                            offset = CGSize(width: 0, height: 0)
                        }
                    }
                }
                .padding()
        }
    }
}

struct AngklungView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            
            AngklungView(
                soundPath: "2_re",
                imagePath: "angklungRe",
                ratio: 2,
                notation: "Do",
                showGlowing: false
            )
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
