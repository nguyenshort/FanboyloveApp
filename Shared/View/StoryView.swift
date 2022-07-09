//
//  StoryView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct StoryView: View {
    
    var story: Story
    
    @StateObject var viewModel: StoryViewModel = StoryViewModel()
    
    var body: some View {
        
        SafeLayoutView(offset: $viewModel.offset) {
            
            VStack(spacing: 0) {
                
                StretchView(image: "https://i.imgur.com/tE4FCAJ.jpg") {
                    
                }
                
                VStack(alignment: .leading, spacing: 30){
                
                    
                    StoryInfoView()
                    
                    StoryChaptersView()
                    
                    StoryReviewsView()
                    
                    StoryMayLikeView()
                                        
                
                    
                }
                .padding(.bottom, 60)
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .background(Color.white)
                .clipShape(BorderOnlyShape(radius: 40, corners: [.topRight, .topLeft]))
                .offset(y: -40)
                
            }
            
        }
        .overlay(
            
            
            SafeAppBarView(offset: $viewModel.offset, title: "Chạm Vào Giai Điệu", anchor: 100)
            
            ,alignment: .top
            
        )
        .overlay (
            
            StoryFloatingButtonView()
            
            ,alignment: .bottom
            
        )
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            
            viewModel.story = story
            
        }
        .environmentObject(viewModel)
        
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            StoryView(story: _stories.first!)
            
        }
    }
}

