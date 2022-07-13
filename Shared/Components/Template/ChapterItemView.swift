//
//  ChapterItemView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct ChapterItemView: View {
    
    var chapter: ChapterBase
    var countView: Int
    var createdAt: Double
    
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
                    
                    Text(formatTime(timestap: createdAt))
                    
                    if chapter.avatar != "" {
                        
                        Spacer()
                        
                    }
                    
                    
                    if countView > 0 {
                        Image(systemName: "eye")
                            .font(.caption)
                        
                        Text("\(countView)")
                            .font(.caption)
                    }
                    
                    
                }
                .foregroundColor(Color("TextContentColor"))
                .font(.subheadline)
                
            }
            
        }
        
    }
    
    static public var preview: some View {
        
        HStack(alignment: .top, spacing: 15) {
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.gray.opacity(0.3))
                .frame(width: 150, height: 84)
                .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 0)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Chapter Name Here")
                    .font(.callout)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(2)
                    .padding(.top, 5)
                
                Spacer()
                
                HStack(spacing: 5) {
                    
                    Text("14/04/2022")
                    
                    Spacer()
                    
                    
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
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
