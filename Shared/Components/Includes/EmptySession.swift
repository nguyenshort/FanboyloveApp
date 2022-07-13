//
//  EmptySession.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI

struct EmptySession: View {
    var body: some View {
        VStack {
            
            LottieView(lottieFile: "lazydoge-sleeping", loop: .loop)
            
            Text("Chẳng có gì ở đây cả...")
                .font(.caption)
                .foregroundColor(Color("TextContentColor"))
            
        }
    }
}

struct EmptySession_Previews: PreviewProvider {
    static var previews: some View {
        EmptySession()
    }
}
