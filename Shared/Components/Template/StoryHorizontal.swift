//
//  StoryHorizontal.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryHorizontal: View {
    
    var story: Story
    
    var body: some View {
        
        
        NavigationLink {
            
        } label: {
            
            IntrinsicGeometryReader { proxy in
                
                HStack(alignment: .top, spacing: 18) {
                    
                    ImageView(story.avatar)
                        .scaledToFill()
                        .frame(width: proxy.size.width / 3, height: (proxy.size.width / 3) * 4 / 3)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(story.name)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("TextColor"))
                            .lineLimit(2)
                        
                        HStack(spacing: 2) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                            Text("4.5")
                                .foregroundColor(Color("TextColor"))
                                .padding(.leading, 5)
                            
                        }
                        .font(.subheadline)
                        
                        Text(story.content)
                            .foregroundColor(.secondary)
                            .lineSpacing(3)
                            .lineLimit(3)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            
        }
        .buttonStyle(PlainButtonStyle())


        
    }
}

struct StoryHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
