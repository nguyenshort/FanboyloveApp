//
//  StoryViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

class StoryViewModel: ObservableObject {
    
    /// State truyện.
    /// Hứng sự kiện theo đổi truyện theo apollo =-> update lại
    @Published var story: GetStoryQuery.Data.Story?
    
    /// Counters được transform từ story
    var counters: [CounterBase] {
        get {
            return story?.counter.map({ item in
                return item.fragments.counterBase
            }) ?? []
        }
    }
    
    // Show data hoặc placeholder
    @Published var isReady: Bool = false
    
    /// Followers
    /// Danh sách những người đã bookmark truyện
    /// Chỉ show list avatar và lấy 3 người duy nhất
    @Published var followers: [UserBase] = [UserBase]()
    @Published var isShowFollowers: Bool = false
    
    
    
    // Chương State
    /// Lấy dánh sách chương. Chỉ lấy 3-4 chương gần nhất
    /// Cần lắng nghe sự kiện để thêm chương mới
    @Published var isShowChapters: Bool = false
    @Published var chapters: [GetChaptersQuery.Data.Chapter] = [GetChaptersQuery.Data.Chapter]()
    
    func getStory(slug: String) -> Void {
        isReady = false
        Network.useApollo.fetch(query: GetStoryQuery(slug: slug)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                if graphQLResult.data?.story != nil {
                    self.story = graphQLResult.data?.story
                    withAnimation(.easeInOut) {
                        self.isReady = true
                    }
                }
                
                break
            case .failure(_): break
                //
            }
        }
    }
    
    // Story properties
    func getName() -> String {
        return isReady ? story?.name ?? "" : "It is a long established"
    }
    
    func getContent() -> String {
        return isReady ? story?.content ?? "" : "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
    }
    
    func countView() -> Int {
        if !isReady {
            return 0
        }
        let counter = story?.counter.first(where: { item in
            return item.fragments.counterBase.name == .view && item.fragments.counterBase.scope == .total
        })
        
        if counter != nil {
            return (counter?.fragments.counterBase.value)!
        }
        
        return 0
    }
    
    func countBookmark() -> Int {
        if !isReady {
            return 0
        }
        let counter = story?.counter.first(where: { item in
            return item.fragments.counterBase.name == .bookmark && item.fragments.counterBase.scope == .total
        })
        
        if counter != nil {
            return (counter?.fragments.counterBase.value)!
        }
        
        return 0
    }
    
    func countRating() -> Int {
        return extractCounter(name: .review, scope: .total)?.value ?? 0
    }
    
    func ratingScore() -> Double {
        let score = extractCounter(name: .reviewScore, scope: .total)?.value ?? 0
        return Double(score) / Double(countRating()) / Double(5)
    }
    
    func activityScore() -> Int {
        return story?.counter.reduce(0, { prev, current in
            return prev + current.fragments.counterBase.value
        }) ?? 0
    }
    
    func extractCounter(name: CounterName, scope: CounterScope) -> CounterBase? {
        return story?.counter.first(where: { item in
            return item.fragments.counterBase.name == name && item.fragments.counterBase.scope == scope
        })?.fragments.counterBase
    }
    
    
    
    func getChapters() -> Void {
        let query: GetChaptersQuery = GetChaptersQuery(filter: GetChaptersFilter(limit: 5, sort: "order", story: story?.id))
        Network.useApollo.fetch(query: query) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data!.chapters else { return }
            
            self.chapters = data
            self.isShowChapters = true
            
        }
    }
}


// Follower Support
extension StoryViewModel {
    
    func getFollowers() -> Void {
        let follwersQueries = GetBookmarkersQuery(filter: GetBookmarksFilter(limit: 4, offset: 0, sort: "createdAt", story: story?.id))
        Network.useApollo.fetch(query: follwersQueries) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.bookmarks else { return }
            
            self.followers = data.map({ item in
                return item.user.fragments.userBase
            })
            
            self.isShowFollowers = true
            
        }
    }
    
}


public func extractCounter(counters: [CounterBase], name: CounterName, scope: CounterScope = .total) -> CounterBase? {
    return counters.first(where: { item in
        return item.name == name && item.scope == scope
    })
}
