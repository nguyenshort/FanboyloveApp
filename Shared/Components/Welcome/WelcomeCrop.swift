//
//  WelcomeCrop.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct WelcomeCrop: View {
    
    @Binding var currentIndex: Int
    
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            
            WelcomeShape()
                .fill(.white)
                .frame(width: screenWidth(), height: screenWidth())
                .rotationEffect(.degrees(-15 * currentIndex))
                .animation(.spring(), value: currentIndex)
                .scaleEffect(show ? 1 : 0)
                .opacity(show ? 1 : 0)
                .animation(.spring(), value: show)
            
            WelcomeLayerShape()
                .fill(.white.opacity(0.2))
                .frame(width: screenWidth(), height: screenWidth())
                .scaleEffect(1.1)
                .rotationEffect(.degrees(-15 * currentIndex))
                .animation(.spring().delay(0.2), value: currentIndex)
                .scaleEffect(show ? 1 : 0)
                .opacity(show ? 1 : 0)
                .animation(.spring().delay(0.3), value: show)
            
        }
            .padding(.top, 80)
            .scaleEffect(0.9)
            .task {
                show.toggle()
            }
    }
}

struct WelcomeCrop_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            WelcomeView()
            
        }
    }
}

