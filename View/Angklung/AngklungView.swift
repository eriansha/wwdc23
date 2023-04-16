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
    
    @State private var wiggleTogle = false
    @State private var offset = CGSize(width: 0, height: 0)
    
    var body: some View {
        Image(imagePath)
            .resizable()
            .frame(
                width: 100 - (5 * CGFloat(ratio)),
                height: 200 - (10 * CGFloat(ratio))
            )
            .rotationEffect(.degrees(wiggleTogle ? 5 : 0))
            .offset(offset)
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

struct AngklungView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AngklungView(
                soundPath: "2_re",
                imagePath: "angklungRe",
                ratio: 2
            )
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
