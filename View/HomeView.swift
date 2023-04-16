//
//  HomeView.swift
//  Ngklung
//
//  Created by Ivan on 14/04/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .center) {
                VStack {
                    HStack {
                        Text("iNgklung")
                            .font(.system(size: 90))
                            .foregroundColor(textColor)
                            .bold()
                            
                        
                        Image("angklungDo2")
                            .resizable()
                            .rotationEffect(.degrees(-10))
                            .frame(width: 40, height: 90)
                    }
                    
                    Text("Playing Angklung interactively")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 35)
                
                NavigationLink {
                    RotateView()
                } label: {
                    Text("Start")
                        .font(.largeTitle)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 30)
                }.buttonStyle(.bordered)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
