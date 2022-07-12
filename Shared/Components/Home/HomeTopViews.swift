//
//  HomeTopViewsView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeTopViews: View {
    
    @State var stories: [BaseStory] = [BaseStory]()
    
    let query: GetStoriesFilter = GetStoriesFilter(limit: 6, offset: 0, sort: "VIEW-TOTAL")
    
    func getTopView() -> Void {
        Network.useApollo.fetch(query: HomeTopViewQuery(filter: query)) { result in
            switch result {
            case .success(let graphQLResult):
                stories = (graphQLResult.data?.stories ?? []).map({ item in
                    return item.fragments.baseStory
                })
                break
            case .failure(_): break
                //
            }
        }
    }
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Xem Nhiều") {
                Button {
                    
                } label: {
                    
                    Image(systemName: "arrow.right")
                        .foregroundColor(.secondary)
                    
                }
            }
            
            if stories.isEmpty {
                
                GridStories(items: Array(repeating: 1, count: 6)) { _ in
                    StorySimple.preview
                }
                .redacted(reason: .placeholder)
                
            } else {
                
                GridStories(items: stories) { story in
                    StorySimple(story: story)
                }
            }
            
        }
        .task {
            getTopView()
        }
        
    }
}

struct HomeTopViews_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
