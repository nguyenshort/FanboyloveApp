//
//  ProgessBar.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI
import SwiftUIX

struct ProgessBar: View {
    
    @Binding var progess: CGFloat
    var auto: Bool = false
    
    var body: some View {
        IntrinsicGeometryReader { proxy in
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color("Placeholder"))
                .frame(height: 12)
                .overlay(alignment: .leading){
                    Rectangle()
                        .fill(Color("MainStartColor"))
                        .frame(width: proxy.size.width * progess)
                        .clipped()
                        .animation(.linear.speed(0.5), value: progess)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
        .task {
            if auto {
                withAnimation(.linear.delay(1)) {
                    progess = 1
                }
            }
        }
    }
}

struct ProgessBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgessBar(progess: .constant(0.5), auto: true)
            .padding()
    }
}
