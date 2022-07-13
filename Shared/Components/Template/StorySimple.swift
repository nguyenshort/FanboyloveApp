//
//  StorySimple.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 09/07/2022.
//

import SwiftUI
import SwiftUIX

struct StorySimple: View {
    
    var story: StoryBase
    
    var body: some View {
        
        NavigationLink {
            
            StoryView(slug: story.slug)
            
        } label: {
            
            VStack(alignment: .leading, spacing: 10) {
                IntrinsicGeometryReader { proxy in
                    
                    Rectangle()
                        .fill(.clear)
                        .frame(height: proxy.size.width * 4/3)
                        .background {
                            
                            ImageView(story.avatar)
                                .scaledToFill()
                        }
                        .cornerRadius(10)
                        .clipped()
                        .contentShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                Text(story.name)
                    .foregroundColor(Color("TextColor"))
                    .multilineTextAlignment(.leading)
                
            }
            
        }

    }
    
    static var preview: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            IntrinsicGeometryReader { proxy in
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(height: proxy.size.width * 4/3)
                
            }
            
            Text("Short Name of Story Here")
                .foregroundColor(Color("TextColor"))
            
        }
    }
}

struct StorySimple_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
