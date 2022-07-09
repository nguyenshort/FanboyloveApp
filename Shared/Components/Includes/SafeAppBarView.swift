//
//  SafeAppBarView.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI

struct SafeAppBarView: View {
    
    @Binding var offset: CGFloat
    
    var title: String = ""
    
    var anchor: CGFloat = .zero
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack {
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.backward")
                
            }
            
            Text(title)
                .fontWeight(.semibold)
                .lineLimit(1)
                .opacity(offset < -100 ? 1 : 0)
                .offset(y: offset < -100 ? 0 : -20)
                .animation(.spring(), value: offset)
            
            Spacer()
            
            Button {
                
            } label: {
                
                Image(systemName: "paperplane")
                
            }
            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding([.top, .bottom])
        .padding(.top, 30)
        .background( offset < -100 ? Color("MainStartColor") : .clear)
        .animation(.spring(), value: offset)
        
    }
}

struct SafeAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(story: _stories.first!)
            
        }
    }
}
