//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

let paragraphs: [String] = [
    "Angklung is a traditional musical instrument from Indonesia that is made of bamboo. It consists of a set of bamboo tubes of different lengths that are suspended on a frame. Each tube is tuned to a specific pitch, and when shaken, it produces a distinct sound.",
    "The instrument is played by shaking it, and the musician usually holds several tubes in each hand. The sound produced by the angklung is melodic and soothing, and it is often used in traditional Indonesian music.",
    "The angklung has a rich cultural significance in Indonesia and is often played during ceremonies and special occasions. It is also commonly used in music education and is a popular instrument for children to learn."
]

struct AboutView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                VStack {
                    Text("About Angklung")
                        .font(.system(size: 90))
                        .foregroundColor(textColor)
                        .bold()
                        .padding(.bottom, 20)
                    
                    ForEach(paragraphs, id: \.self) { paragraph in
                        Text(paragraph)
                            .font(.body)
                            .frame(width: 1000)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(textColor)
                            .padding(.vertical, 5)
                    }
                }.padding(.bottom, 50)
                
                NavigationLink {
                    InstructionView()
                } label: {
                    Text("Continue")
                        .font(.largeTitle)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                }.buttonStyle(.bordered)
                
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
