//
//  SwiftUIView.swift
//  
//
//  Created by Ivan on 15/04/23.
//

import SwiftUI

struct RotateView: View {
    @State private var isRotate: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .center) {
                Text("We suggest rotating your device into landscape to get the best experience!")
                    .font(.title)
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
                
                Image(systemName: "ipad")
                    .font(.system(size: 200))
                    .foregroundColor(textColor)
                    .rotationEffect(.degrees(isRotate ? -90 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)) {
                            isRotate.toggle()
                        }
                    }
                
                NavigationLink {
                    AboutView()
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
            .frame(maxWidth: 600)
        }
    }
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView()
    }
}
