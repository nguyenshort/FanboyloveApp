//
//  StoryChaptersView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct StoryChapters: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    @State var isReady: Bool = false
    @State var chapters: [GetChaptersQuery.Data.Chapter] = [GetChaptersQuery.Data.Chapter]()
    
    var body: some View {
        
        Group {
            
            if isReady {
                VStack(alignment: .leading, spacing: 15) {
                    
                    TitleView(title: "Chương Mục") {
                        
                        if !chapters.isEmpty {
                            Button {
                                
                            } label: {
                                
                                Text("Xem tất cả")
                                
                                Image(systemName: "arrow.right")
                                
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }

                
                    }
                    
                    if chapters.isEmpty {
                        
                        EmptySession()
                            .frame(height: 200)
                        
                    } else {
                        
                        VStack(spacing: 15) {
                            
                            ForEach(chapters, id: \.id) { chapter in
                                
                                VStack(spacing: 0) {
                                    
                                    ChapterItemView(
                                        chapter: chapter.fragments.chapterBase,
                                        countView: viewModel.extractCounter(name: .view, scope: .total)?.value ?? 0,
                                        createdAt: chapter.createdAt
                                    )
                                    
                                    if chapters.last?.id != chapter.id {
                                        
                                        Divider()
                                            .padding(.top, 15)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
            } else {
                StoryChapters.preview
                    .redacted(reason: .placeholder)
            }
            
        }
        .task {
            getChapters()
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
    
    func getChapters() -> Void {
        let query: GetChaptersQuery = GetChaptersQuery(filter: GetChaptersFilter(limit: 5, sort: "order", story: viewModel.story?.id))
        Network.useApollo.fetch(query: query) { result in
            
            switch result {
            case .success(let graphQLResult):
                
                if graphQLResult.data?.chapters != nil {
                    self.chapters = graphQLResult.data!.chapters
                    self.isReady = true
                }
                
                break
            case .failure(_): break
                //
            }
            
        }
    }
    
    func getCounter(_ chapter: GetChaptersQuery.Data.Chapter) -> [CounterBase] {
        return chapter.counter.map({ item in
            return item.fragments.counterBase
        })
    }
    
}

struct StoryChapters_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
