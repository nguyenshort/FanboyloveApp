//
//  StoryView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct StoryView: View {
    
    var slug: String
    
    @StateObject var viewModel: StoryViewModel = StoryViewModel()
    
    var body: some View {
        
        SafeLayoutView(offset: $viewModel.offset) {
            
            VStack(spacing: 0) {
                
                StretchView(image: viewModel.story?.avatar ?? "https://i.imgur.com/tE4FCAJ.jpg") {
                    
                }
                
                VStack(alignment: .leading, spacing: 30){
                    
                    StoryInfoView()
                    
                    if viewModel.isReady {
                        StoryChapters()
                    } else {
                        StoryChapters.preview
                            .redacted(reason: .placeholder)
                    }
                    
                    StoryReviewsView()
                    
                    StoryMayLikeView()
                    
                }
                .padding(.bottom, 60)
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .background(Color.white)
                .clipShape(BorderOnlyShape(radius: 40, corners: [.topRight, .topLeft]))
                .overlay(alignment: .topTrailing) {
                    StoryBookmark()
                        .offset(x: -20, y: -60/2)
                }
                .offset(y: -40)
                
            }
            
        }
        .overlay(
            
            
            SafeAppBarView(offset: $viewModel.offset, title: viewModel.getName(), anchor: 100)
            
            ,alignment: .top
            
        )
        .overlay (
            
            StoryFloatingButtonView()
                .redacted(reason: viewModel.isReady ? [] : .placeholder)
            
            ,alignment: .bottom
            
        )
        .ignoresSafeArea(.all, edges: .top)
        .environmentObject(viewModel)
        .task {
            viewModel.getStory(slug: slug)
        }
        
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}

