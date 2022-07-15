//
//  StoryBookmark.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI
import Apollo

struct StoryBookmark: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    @EnvironmentObject var app: AppViewModel
    
    var body: some View {
        
        Button {
            
            viewModel.toggleBookmark()
            
        } label: {
            
            Circle()
                .fill(Color("Rose"))
                .frame(width: 60, height: 60)
                .opacity(viewModel.isBookmarking ? 0.7 : 1)
                .animation(.default, value: viewModel.isBookmarking)
                .overlay {
                    
                    if viewModel.isBookmarked {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    } else {
                        Image(systemName: "bookmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .background {
                    Circle()
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: Color("Rose").opacity(0.1), radius: 5, x: 0, y: 0)

                }
                .disabled(viewModel.isBookmarking)
        }
        .withAuth()
        .task {
            viewModel.checkBookmark()
        }
        .onChange(of: app.auth) { _auth in
            if _auth {
                viewModel.checkBookmark()
            } else {
                viewModel.isBookmarked = false
            }
        }
        
    }
    
    static var preview: some View {
        
        Button {
            
            // toggleBookmark()
            
        } label: {
            
            Circle()
                .fill(Color("Rose"))
                .frame(width: 60, height: 60)
                .overlay {
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                }
                .background {
                    Circle()
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: Color("Rose").opacity(0.1), radius: 5, x: 0, y: 0)

                }
                .disabled(true)
        }
        
    }
}

struct StoryBookmark_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}

