//
//  HomeCompletedView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeCompleted: View {
    
    typealias CompletedStory = HomeEndStoryQuery.Data.Story
    
    @State var stories: [CompletedStory] = [CompletedStory]()
    
    
    
    var body: some View {
        
        SessionBlock(title: "Đã Kết Thức") {
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.secondary)
                
            }
            
        } content: {
            if stories.isEmpty {
                VStack(spacing: 20) {
                    
                    ForEach(0..<3, id: \.self) { _ in

                        StoryHorizontal.preview

                    }
                    
                }
                .redacted(reason: .placeholder)

            } else {
                
                VStack(spacing: 20) {
                    
                    ForEach(stories, id: \.id) { story in

                        StoryHorizontal(story: getBaseStory(story: story), content: getStoryContent(story: story))

                    }
                    
                }
            }
        }
        .task {
            getStories()
        }
        
    }
}

extension HomeCompleted {
    
    func getStories() -> Void {
        
        let query: GetStoriesFilter = GetStoriesFilter(limit: 3, offset: 0, sort: "VIEW-TOTAL", status: [StoryStatus.end])
        Network.useApollo.fetch(query: HomeEndStoryQuery(filter: query)) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    stories = graphQLResult.data?.stories ?? []
                }
                break
            case .failure(_): break
                //
            }
        }
    }
    
    func getBaseStory(story: CompletedStory) -> StoryBase {
        return story.fragments.storyBase
    }
    
    func getStoryContent(story: CompletedStory) -> String {
        return story.content
    }
    
}

struct HomeCompleted_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
