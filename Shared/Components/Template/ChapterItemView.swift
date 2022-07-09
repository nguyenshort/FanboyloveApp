//
//  ChapterItemView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct ChapterItemView: View {
    
    var chapter: Chapter
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 15) {
            
            if chapter.avatar != nil {
                
                ImageView(chapter.avatar)
                    .scaledToFill()
                    .frame(width: 150, height: 84)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 0)
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(chapter.name)
                    .font(.callout)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(2)
                    .padding(.top, 5)
                
                Spacer()
                
                HStack(spacing: 5) {
                    
                    Text("14/04/2022")
                    
                    if chapter.avatar != nil {
                        
                        Spacer()
                        
                    }
                    
                    
                    Image(systemName: "eye")
                        .font(.caption)
                    
                    Text("120")
                        .font(.caption)
                    
                    
                }
                .foregroundColor(Color("TextContentColor"))
                .font(.subheadline)
                
            }
            
        }
        
    }
}

struct ChapterItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
