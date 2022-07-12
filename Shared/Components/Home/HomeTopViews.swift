//
//  HomeTopViewsView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeTopViews: View {
    
    @State var stories: [HomeTopViewQuery.Data.Story] = [HomeTopViewQuery.Data.Story]()
    
    let query: GetStoriesFilter = GetStoriesFilter(limit: 6, offset: 0, sort: "VIEW-TOTAL")
    
    func getTopView() -> Void {
        Network.useApollo.fetch(query: HomeTopViewQuery(filter: query)) { result in
            switch result {
            case .success(let graphQLResult):
                stories = graphQLResult.data?.stories ?? []
                break
            case .failure(_): break
                //
            }
        }
    }
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 15) {
            
            HStack {
                
                Text("Xem Nhiều")
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
            
            let gridColumns: [GridItem] = Array.init(repeating: GridItem(.flexible(), spacing: 15, alignment: .top), count: 3)
            
            if stories.isEmpty {
                
                LazyVGrid(columns: gridColumns, spacing: 20) {
                    ForEach(0..<6, id: \.self) { _ in
                        
                        StorySimple.preview
                            .redacted(reason: .placeholder)
                        
                    }
                }
                
            } else {
                LazyVGrid(columns: gridColumns, spacing: 15) {
                    ForEach(stories, id: \.id) { story in
                        
                        StorySimple(avatar: story.avatar, name: story.name)
                        
                    }
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
