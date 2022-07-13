//
//  StoryFlowers.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI

struct StoryFlowers: View {
    
    var body: some View {
        // Mỗi avatar sẽ là 34 x 34
        // sẽ xếp chồng 1/2 => 34/2 * length
        ZStack {
            
            ForEach(0..<_bookmarkers.count, id: \.self) { index in
                
                ImageView(_bookmarkers[index].avatar)
                    .scaledToFill()
                    .frame(width: 34, height: 34)
                    .cornerRadius(34)
                    .overlay(
                        
                        Circle()
                            .stroke(Color("TextColor").opacity(0.1), lineWidth: 2)
                        
                    )
                    .shadow(color: .black.opacity(0.03), radius: 3, x: 0, y: 0)
                    .offset(x: -CGFloat(index * 34/2))
                    .zIndex(Double(_bookmarkers.count - index))
                
            }
            
        }
        .frame(width: CGFloat((_bookmarkers.count - 2) * (34/2)))
    }
}

struct StoryFlowers_Previews: PreviewProvider {
    static var previews: some View {
        StoryFlowers()
    }
}
