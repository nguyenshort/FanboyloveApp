//
//  HomeCompletedView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeCompleted: View {
    
    typealias StoryWithCounter = HomeEndStoryQuery.Data.Story
    
    @State var stories: [StoryWithCounter] = [StoryWithCounter]()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
                    
            HStack {
                
                Text("Đã Kết Thúc")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("TextColor"))
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.secondary)
                    
                }
                
            }
            
            if stories.isEmpty {
                VStack(spacing: 20) {
                    
                    ForEach(0..<3, id: \.self) { _ in

                        StoryHorizontal.preview

                    }
                    
                }
                .redacted(reason: .placeholder)

            } else {
                
                VStack(spacing: 20) {
                    
                    ForEach(stories, id: \.fragments.storyCounter.fragments.baseStory.id) { story in

                        StoryHorizontal(story: story)

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
}

struct HomeCompleted_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
