//
//  StoryBookmark.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI

struct StoryBookmark: View {
    var body: some View {
        
        Button {
            
        } label: {
            
            Circle()
                .fill(Color("Rose"))
                .frame(width: 60, height: 60)
                .overlay {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 26, height: 26)
                }
                .background {
                    Circle()
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: Color("Rose").opacity(0.1), radius: 5, x: 0, y: 0)

                }
        }

        
    }
}

struct StoryBookmark_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
