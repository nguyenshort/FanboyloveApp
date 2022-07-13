//
//  StoryMayLikeView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI
import Apollo

struct StoryMayLike: View {
    
    @State var stories: [StoryBase] = [StoryBase]()
    @State var isReady: Bool = false
    
    var body: some View {
        
        Group {
            if isReady {
                
                SessionBlock(title: "Có Thể Bạn Thích") {
                    Button {
                        
                    } label: {
                        
                        Text("Xem tất cả")
                        
                        Image(systemName: "arrow.right")
                        
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                } content: {
                    GridStories(items: stories) { story in
                        StorySimple(story: story)
                    }
                }
                
            } else {
                StoryMayLike.preview
            }
        }
        .task {
            getStories()
        }
        
    }
    
    static var preview: some View {
        SessionBlock(title: "Có Thể Bạn Thích") {
            Button {
                
            } label: {
                
                Text("Xem tất cả")
                
                Image(systemName: "arrow.right")
                
            }
            .font(.caption)
            .foregroundColor(.secondary)
        } content: {
            GridStories(items: Array(repeating: 1, count: 6)) { _ in
                StorySimple.preview
            }
        }
    }
}

extension StoryMayLike {
    func getStories(cachePolicy: CachePolicy = .default) -> Void {
        
        let query = SomeStoriesFilter(size: 6)
        Network.useApollo.fetch(query: SomeStoriesQuery(filter: query), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.stories = (graphQLResult.data?.someStories ?? []).map({ item in
                        return item.fragments.storyBase
                    })
                    self.isReady = true
                }
                break
            case .failure(_): break
                //
            }
        }
    }
}

struct StoryMayLike_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
