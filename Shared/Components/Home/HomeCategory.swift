//
//  HomeCategory.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI
import Apollo

struct HomeCategory: View {
    
    var category: CategoryBase
    
    @State var loading: Bool = false
    @State var stories: [StoryBase] = [StoryBase]()
    @State var count: Int = 0
    
    var body: some View {
        
        SessionBlock(title: category.name) {
            Button {
                
            } label: {
                Image(systemName: "arrow.right")
                    .foregroundColor(.secondary)
            }
        } content: {
            if stories.isEmpty {
                
                GridStories(items: Array(repeating: 1, count: 6)) { _ in
                    StorySimple.preview
                }
                .redacted(reason: .placeholder)
                
            } else {
             
                GridStories(items: stories) { story in
                    StorySimple(story: story)
                }
                .redacted(reason: loading ? .privacy : [])
                
            }
            
            HStack(spacing: 15) {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.gray.opacity(0.2))
                    .frame(height: 45)
                    .overlay {
                        Text("Xem Thêm")
                            .font(.callout)
                            .foregroundColor(Color("InputDarkBackground"))
                    }
                
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.gray.opacity(0.2))
                    .frame(height: 45)
                    .overlay {
                        HStack {
                            
                            Image(systemName: "shuffle")
                                .foregroundColor(Color("InputDarkBackground"))
                            
                            Text("Ngẫu Nhiên")
                                .font(.callout)
                                .foregroundColor(Color("InputDarkBackground"))
                            
                        }
                    }
                    .onTapGesture {
                        getStories(cachePolicy: .fetchIgnoringCacheData)
                    }
                    .disabled(loading)
            }
        }
        .task {
            getStories()
        }
    }
}

extension HomeCategory {
    func getStories(cachePolicy: CachePolicy = .default) -> Void {
        
        self.loading = true
        
        let query = SomeStoriesFilter(category: self.category.id, size: 6)
        Network.useApollo.fetch(query: SomeStoriesQuery(filter: query), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.stories = (graphQLResult.data?.someStories ?? []).map({ item in
                        return item.fragments.storyBase
                    })
                    self.loading = false
                }
                break
            case .failure(_): break
                //
            }
        }
    }
    
    func getCount(cachePolicy: CachePolicy = .default) -> Void {
        Network.useApollo.fetch(query: CountStoriesQuery(filter: CountStoriesFilter(category: self.category.id)), cachePolicy: cachePolicy) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.count = graphQLResult.data?.countStories ?? 0
                }
                break
            case .failure(_): break
                //
            }
        }
    }
}

struct HomeCategory_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
