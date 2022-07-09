//
//  ChapterView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI
import SwiftUIX

struct ChapterView: View {
    
    var story: Story
    
    @StateObject var viewModel: ChapterViewModel = ChapterViewModel()
    @State var lastOffset: CGFloat = .zero
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: true) {
            
            IntrinsicGeometryReader { proxy in
                
                VStack(spacing: 0) {
                    
                    ForEach(0..<10, id: \.self) { _ in
                        
                        ImageView("https://i.imgur.com/tDJLUaB.png")
                            .scaledToFit()
                        
                    }
                    
                    HStack(spacing: 20) {
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color("TextContentColor").opacity(0.2))
                            .frame(height: 1)
                        
                        Text("Hết Chương 20".uppercased())
                            .foregroundColor(Color("TextContentColor"))
                            .fixedSize(horizontal: true, vertical: true)
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color("TextContentColor").opacity(0.2))
                            .frame(height: 1)
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 30)
                    
                    StoryReviewsView()
                        .padding(.horizontal, 20)
                    
                }
                .onChange(of: proxy.frame(in: .global).minY) { offset in
                    viewModel.showToolBar = lastOffset > offset && offset < -50
                    viewModel.offset = offset
                    lastOffset = offset
                }
                
            }
            
        }
        .overlay(
            
            ChapterAppBarView()
            
            ,alignment: .top
            
        )
        .overlay(
            
            ChapterToolBar()
            
            ,alignment: .bottom
            
        )
        .ignoresSafeArea(.all, edges: .vertical)
        .environmentObject(viewModel)
        
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            ChapterView(story: _stories.first!)
            
        }
        
    }
}
