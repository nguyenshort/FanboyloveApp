//
//  StoryChaptersView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct StoryChapters: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Chương Mục") {
                
                Button {
                    
                } label: {
                    
                    Text("Xem tất cả")
                    
                    Image(systemName: "arrow.right")
                    
                }
                .font(.caption)
                .foregroundColor(.secondary)

        
            }
            
            VStack(spacing: 15) {
                
                ForEach(viewModel.chapters, id: \.id) { chapter in
                    
                    VStack(spacing: 0) {
                        
                        ChapterItemView(
                            chapter: chapter.fragments.chapterBase,
                            countView: viewModel.extractCounter(name: .view, scope: .total)?.value ?? 0,
                            createdAt: chapter.createdAt
                        )
                        
                        if _chapters.last?.id != chapter.id {
                            
                            Divider()
                                .padding(.top, 15)
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        .task {
            viewModel.getChapters()
        }
        
    }
    
    static public var preview: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Chương Mục") {
                
                Button {
                    
                } label: {
                    
                    Text("Xem tất cả")
                    
                    Image(systemName: "arrow.right")
                    
                }
                .font(.caption)
                .foregroundColor(.secondary)

        
            }
            
            VStack(spacing: 15) {
                
                ForEach(0..<3, id: \.self) { index in
                    
                    VStack(spacing: 0) {
                        
                        ChapterItemView.preview
                        
                        if index != 4 {
                            
                            Divider()
                                .padding(.top, 15)
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }
}

extension StoryChapters {
    
    func getCounter(_ chapter: GetChaptersQuery.Data.Chapter) -> [CounterBase] {
        return chapter.counter.map({ item in
            return item.fragments.counterBase
        })
    }
    
}

struct StoryChapters_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
