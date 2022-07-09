//
//  StoryAppBarView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryAppBarView: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.backward")
                
            }
            
            Text("Chạm Vào Giai Điệu")
                .fontWeight(.semibold)
                .lineLimit(1)
                .opacity(viewModel.offset < -100 ? 1 : 0)
                .offset(y: viewModel.offset < -100 ? 0 : -20)
            
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
        .background( viewModel.offset < -100 ? Color("MainStartColor") : .clear)
        .animation(.spring(), value: viewModel.offset)
        
    }
}

struct StoryAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        PreviewWrapper {
            
            StoryView(story: _stories.first!)
            
        }
        
    }
}
