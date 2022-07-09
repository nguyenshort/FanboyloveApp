//
//  StoryChaptersView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct StoryChaptersView: View {
    
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Chương Mục") {
                
                Button {
                    
                } label: {
                    
                    Text("Xem tất cả")
                    
                    Image(systemName: "arrow.right")
                    
                }
                .font(.caption)
                .foregroundColor(.secondary)

        
            }
            
            VStack(spacing: 15) {
                
                ForEach(_chapters.lazy) { chapter in
                    
                    VStack(spacing: 0) {
                        
                        ChapterItemView(chapter: chapter)
                        
                        if _chapters.last?.id != chapter.id {
                            
                            Divider()
                                .padding(.top, 15)
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
}

struct StoryChaptersView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
