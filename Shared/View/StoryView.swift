//
//  StoryView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX
import SwiftUIPullToRefresh

struct StoryView: View {
    
    var slug: String
    @StateObject var viewModel: StoryViewModel = StoryViewModel()
    
    @State var offset: CGFloat = .zero
    
    var body: some View {
        
        RefreshableScrollView(loadingViewBackgroundColor: .clear, threshold: 80) { done in
            
            done()
            
            // Todo
            
        } progress: { state in
            
            if state == .waiting {
                //
               } else if state == .primed {
                   
                   Image("cat-paw")
                       .resizable()
                       .scaledToFit()
                       .frame(height: 40)
                   
               } else {
                   ProgressView()
               }
            
        } content: {
            LazyVStack(spacing: 0) {
                
                StoryHeader(offset: $offset)
                
                VStack(alignment: .leading, spacing: 30){
                    
                    
                    Text("\(offset)")
                    
                    if viewModel.isReady {
                        
                        StoryInfoView()
                        StoryChapters()
                        StoryReviews()
                        StoryMayLike()
                        
                    } else {
                        StoryInfoView.preview
                            .redacted(reason: .placeholder)
                        
                        StoryChapters.preview
                            .redacted(reason: .placeholder)
                        
                        StoryReviews.preview
                            .redacted(reason: .placeholder)
                        
                        StoryMayLike.preview
                            .redacted(reason: .placeholder)
                        
                        
                    }
                    
                }
                .padding(.bottom, 60)
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .background(Color.white)
                .clipShape(BorderOnlyShape(radius: 40, corners: [.topRight, .topLeft]))
                .overlay(alignment: .topTrailing) {
                    
                    Group {
                        if viewModel.isReady {
                            StoryBookmark()
                        } else {
                            StoryBookmark.preview
                                .redacted(reason: .placeholder)
                        }
                    }
                    .offset(x: -20, y: -60/2)
                    
                }
            }
        }
        .overlay (
            
            StoryFloatingButton()
                .redacted(reason: viewModel.isReady ? [] : .placeholder)
            
            ,alignment: .bottom
            
        )
        .overlay(alignment: .top) {
            StoryAppBar(offset: $offset)
        }
        .ignoresSafeArea(.all, edges: .top)
        .environmentObject(viewModel)
        .task {
            viewModel.getStory(slug: slug)
        }

    }
}

/// Các trạng thái của RefreshStatus
/// InActive xảy ra khi không kích hoạt
/// Active là khi scroll tới điểm kích hoạt => Buông tay => chuyển qua Loading
/// Xảy ra khi đang loading => có thể off
enum RefreshStatus {
    case InActive
    case Active
    case Loading
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}

