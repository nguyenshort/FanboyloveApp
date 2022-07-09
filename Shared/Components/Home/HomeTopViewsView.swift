//
//  HomeTopViewsView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeTopViewsView: View {
    
    let data = (1...20).map { "Item \($0)" }
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            
            HStack {
                
                Text("Xem Nhiều")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("TextColor"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.secondary)
                    
                }
                
            }
            
            LazyVGrid(columns: Array.init(repeating: GridItem(.flexible(), spacing: 20, alignment: .top), count: 3), spacing: 20) {
                ForEach(_stories) { story in
                    
                    StoryVerticalItem(story: story)
                    
                }
            }

            
        }
        
    }
}

struct HomeTopViewsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
