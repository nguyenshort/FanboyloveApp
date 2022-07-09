//
//  StoryFloatingButtonView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryFloatingButtonView: View {
    var body: some View {
        
        Button {
            
        } label: {
            
            HStack(spacing: 10) {
                
                Text("Đọc Ngay")
                    .font(.callout)
                
                Image(systemName: "arrow.forward")
                
            }
            .foregroundColor(Color.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 15)
            .background(Color("TextColor"))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
            
        }
        
    }
}

struct StoryFloatingButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        PreviewWrapper {
            
            StoryView(story: _stories.first!)
            
        }
        
    }
}
