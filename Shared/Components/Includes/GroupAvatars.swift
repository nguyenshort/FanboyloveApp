//
//  StoryFlowers.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI

struct GroupAvatars: View {
    
    var users: [UserBase]
    
    var body: some View {
        // Mỗi avatar sẽ là 34 x 34
        // sẽ xếp chồng 1/2 => 34/2 * length
        ZStack {
            
            ForEach(0..<users.count, id: \.self) { index in
                
                ImageView(users[index].avatar)
                    .scaledToFill()
                    .frame(width: 34, height: 34)
                    .cornerRadius(34)
                    .overlay(
                        
                        Circle()
                            .stroke(.white, lineWidth: 2)
                        
                    )
                    .shadow(color: .black.opacity(0.03), radius: 3, x: 0, y: 0)
                    .offset(x: -CGFloat(index * 34/2))
                    .zIndex(Double(users.count - index))
                
            }
            
        }
        .frame(width: users.count > 2 ? CGFloat((users.count - 2) * (34/2)) : 34)
    }
    
    static var preview: some View {
        ZStack {
            
            ForEach(1..<5, id: \.self) { index in
                
                Circle()
                    .fill(Color("Placeholder"))
                    .frame(width: 34, height: 34)
                    .cornerRadius(34)
                    .overlay(
                        
                        Circle()
                            .stroke(.white, lineWidth: 2)
                        
                    )
                    .offset(x: -CGFloat(index * 34/2))
                    .zIndex(Double(5 - index))
                
            }
            
        }
        .frame(width: CGFloat((5 - 2) * (34/2)))
    }
}

struct StoryFlowers_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
