//
//  InstrumentView.swift
//  Ngklung
//
//  Created by Ivan on 14/04/23.
//

import SwiftUI

struct InstrumentView: View {
    @State private var opacityInstruction: CGFloat = 0.0
    @State private var showCoachmark: Bool = false
    
    let instructions = [
        "Experimenting your creativity to create melodies by tapping on the Angklung in different sequences and rhythms.",
        "Have fun and enjoy the soothing sounds of the Angklung instrument!"
    ]
    
    private var instruments: [Angklung] = [
        .init(
            order: 1,
            soundPath: "1_do",
            imagePath: "angklungDo"
        ),
        .init(
            order: 2,
            soundPath: "2_re",
            imagePath: "angklungRe"
        ),
        .init(
            order: 3,
            soundPath: "3_mi",
            imagePath: "angklungMi"
        ),
        .init(
            order: 4,
            soundPath: "4_fa",
            imagePath: "angklungFa"
        ),
        .init(
            order: 5,
            soundPath: "5_sol",
            imagePath: "angklungSol"
        ),
        .init(
            order: 6,
            soundPath: "6_la",
            imagePath: "angklungLa"
        ),
        .init(
            order: 7,
            soundPath: "7_si",
            imagePath: "angklungSi"
        ),
        .init(
            order: 8,
            soundPath: "1_do2",
            imagePath: "angklungDo2"
        ),
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .leading) {
                Text(instructions[0])
                    .font(.title)
                    .foregroundColor(.white)
                    .opacity(opacityInstruction)
                    .frame(width: 1000)
                    .multilineTextAlignment(.leading)
                    .onAppear(perform: {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.showCoachmark.toggle()
                                self.opacityInstruction = 1.0
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.showCoachmark.toggle()
                                self.opacityInstruction = 0.0
                            }
                        }
                    })
                
                ZStack {
                    Image("angklungRack")
                        .resizable()
                        .frame(
                            width: 1200,
                            height: 400
                        )
                    
                    HStack(alignment: .top) {
                        ForEach(instruments, id: \.self) { instrument in
                            AngklungView(
                                soundPath: instrument.soundPath,
                                imagePath: instrument.imagePath,
                                ratio: instrument.order,
                                notation: instrument.getNumericNotation(),
                                showGlowing: showCoachmark
                            ).offset(
                                CGSize(
                                    width: 0,
                                    height: -40 + (10 * CGFloat(instrument.order))
                                )
                            )
                        }
                    }
                }
                .frame(height: 600)
            }
        }
    }
}

struct InstrumentView_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
