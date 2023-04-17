//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

struct AboutView: View {
    let paragraphs: [String] = [
        "Angklung is a traditional musical instrument from Indonesia that is made of bamboo. It consists of a set of bamboo tubes of different lengths that are suspended on a frame. Each tube is tuned to a specific pitch, and when shaken, it produces a distinct sound.",
        "Playing the angklung is a unique experience that requires coordination and teamwork. The instrument's melodic and soothing sound makes it a popular choice in traditional Indonesian music. The angklung has been recognized by UNESCO as a Masterpiece of Oral and Intangible Heritage of Humanity, which emphasizes its importance in Indonesian culture."
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("About Angklung")
                    .font(.system(size: 90))
                    .foregroundColor(textColor)
                    .bold()
                    .padding(.bottom, 20)
                    
                VStack(alignment: .leading) {
                    ForEach(paragraphs, id: \.self) { paragraph in
                        Text(paragraph)
                            .font(.largeTitle)
                            .foregroundColor(textColor)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.bottom, 50)
                .frame(maxWidth: 1100)
                
                NavigationLink {
                    InstructionView()
                } label: {
                    Text("Continue")
                        .font(.largeTitle)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                }
                .buttonStyle(.bordered)
                .background(primaryButtonColor)
                .cornerRadius(8)
                
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
