//
//  StoryMayLikeView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryMayLikeView: View {
    var body: some View {
       
        VStack(alignment: .leading, spacing: 20) {
            
            TitleView(title: "Có Thể Bạn Thích") {
                
                Button {
                    
                } label: {
                    
                    Text("Xem tất cả")
                    
                    Image(systemName: "arrow.right")
                    
                }
                .font(.caption)
                .foregroundColor(.secondary)

        
            }
            
            VStack(spacing: 20) {
                
                ForEach(_stories) { story in
                    
                    StoryHorizontal(story: story)
                    
                }
                
            }
            
        }
        
    }
}

struct StoryMayLikeView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
