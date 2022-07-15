//
//  HomeTopViewsView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeTopViews: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        
        SessionBlock(title: "Xem Nhiều") {
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.secondary)
                
            }
            
        } content: {
            if !viewModel.isShowTopView {
                
                GridStories(items: Array(repeating: 1, count: 6)) { _ in
                    StorySimple.preview
                }
                .redacted(reason: .placeholder)
                
            } else {
                
                GridStories(items: viewModel.topView) { story in
                    StorySimple(story: story)
                }
            }
        }
        .task {
            viewModel.getTopView()
        }
        
    }
}

struct HomeTopViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
