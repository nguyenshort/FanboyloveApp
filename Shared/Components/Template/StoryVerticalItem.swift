//
//  StoryVerticalItem.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryVerticalItem: View {
    
    var story: Story
    @State var width: CGFloat = .zero
    
    var body: some View {
        
        
        NavigationLink {
            
            Color.blue
            
        } label: {
            
            VStack(alignment: .leading, spacing: 10) {
            
                IntrinsicGeometryReader { proxy in
                                        
                        ImageView(story.avatar)
                            .scaledToFill()
                            .frame(height: proxy.size.width * 4/3)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                }
                
                Text(story.name)
                    .foregroundColor(Color("TextColor"))
                
            }
            
        }
        .buttonStyle(PlainButtonStyle())

        
    }
}

struct StoryVerticalItem_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
