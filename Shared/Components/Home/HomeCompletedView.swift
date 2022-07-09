//
//  HomeCompletedView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeCompletedView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            HStack {
                
                Text("Đã Kết Thúc")
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
            
            VStack(spacing: 20) {
                
                ForEach(_stories) { story in
                    
                    StoryHorizontal(story: story)
                    
                }
                
            }
            
        }
        
    }
}

struct HomeCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
