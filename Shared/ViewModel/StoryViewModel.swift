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
    @Published var isReady: Bool = false
    /// Counters được transform từ story
    var counters: [CounterBase] {
        get {
            return story?.counter.map({ item in
                return item.fragments.counterBase
            }) ?? []
        }
    }
    
    
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
    
    
    // Đánh giá state
    /// Lấy 3 đánh giá mới nhất
    /// Lắng nghe bình luận mới
    @Published var isShowReviews: Bool = false
    @Published var reviews: [GetReviewsQuery.Data.Review] = [GetReviewsQuery.Data.Review]()
    /// Toggle review bottom sheet
    @Published var isOpenAddReview: Bool = false
    /// List review
    @Published var isOpenListReviews: Bool = false
    /// Adding Review
    @Published var isAddingReview: Bool = false
    /// Loading Infinite
    @Published var isLoadingReviews: Bool = false
    /// End loading
    @Published var isEndReviews: Bool = false
    // Sub notify
    @Published var subReview: Cancellable?
    
    
    // Bookmark truyện
    /// Kiểm tra bookmark của user
    /// Lắng nghe thay đổi auth để reset
    @Published var isBookmarked: Bool = false
    @Published var isBookmarking: Bool = false
    
    
    func refresh() -> Void {
        // Delete cache
        guard let story = story else {
            return
        }
        getStory(slug: story.fragments.storyBase.slug, cachePolicy: .fetchIgnoringCacheData)
    }
}

// Story Support
extension StoryViewModel {
    
    func getStory(slug: String, cachePolicy: CachePolicy = .default) -> Void {
        Network.useApollo.fetch(query: GetStoryQuery(slug: slug), cachePolicy: cachePolicy) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.story else { return }
            
            self.story = data
            
            if !self.isReady {
                withAnimation(.easeInOut) {
                    self.isReady = true
                }
            }
        }
    }
    
    func ratingScore() -> Double {
        
        let countRating = extractCounter(counters: counters, name: .review, scope: .total)?.value ?? 0
        let score = extractCounter(counters: counters, name: .reviewScore, scope: .total)?.value ?? 0
        return Double(score) / Double(countRating) / Double(5)
    }
    
    func activityScore() -> Int {
        return story?.counter.reduce(0, { prev, current in
            return prev + current.fragments.counterBase.value
        }) ?? 0
    }
    
}


// Follower Support
extension StoryViewModel {
    
    func getFollowers(cachePolicy: CachePolicy = .default) -> Void {
        let follwersQueries = GetBookmarkersQuery(filter: GetBookmarksFilter(limit: 4, offset: 0, sort: "createdAt", story: story?.id))
        Network.useApollo.fetch(query: follwersQueries, cachePolicy: .default) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.bookmarks else { return }
            
            self.followers = data.map({ item in
                return item.user.fragments.userBase
            })
            
            self.isShowFollowers = true
            
        }
    }
    
}


// Chapters Support
extension StoryViewModel {
    
    func getChapters(cachePolicy: CachePolicy = .default) -> Void {
        
        let query: GetChaptersQuery = GetChaptersQuery(filter: GetChaptersFilter(limit: 5, sort: "order", story: story?.id))
        Network.useApollo.fetch(query: query, cachePolicy: cachePolicy) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data!.chapters else { return }
            
            self.chapters = data
            self.isShowChapters = true
            
        }
    }
    
}


// Review Support
extension StoryViewModel {
    
    func getReviews(limit: Int = 10, sort: String = "createdAt", cachePolicy: CachePolicy = .default) -> Void {
        
        // Turn on loading
        isLoadingReviews = true
        
        let filter = GetReviewsFilter(limit: limit, offset: self.reviews.count, sort: sort, story: story?.id)
        Network.useApollo.fetch(query: GetReviewsQuery(input: filter), cachePolicy: cachePolicy) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.reviews else { return }
            
            if data.isEmpty {
                self.isEndReviews = true
            } else {
                // dumplicate
                data.forEach { item in
                    if !self.reviews.contains(where: { e in
                        return e.id == item.id
                    }) {
                        self.reviews.append(item)
                    }
                }
            }
            
            self.isShowReviews = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLoadingReviews = false
            }
        }
    }
    
    func addReview(content: String, rating: Int, user: UserBase) -> Void {
        
        if isAddingReview {
            return
        }
        
        isAddingReview = true
        
        let input = CreateReviewMutation(input: CreateReviewInput(content: content, rating: rating, story: story!.id))
        
        Network.useApollo.perform(mutation: input) { _ in //[weak self] result in
            
            //            guard let self = self else { return }
            //
            //            guard let data = try? result.get().data?.createReview else { return }
            //
            //            var rawReview = data.jsonObject
            //            rawReview["user"] = user.jsonObject
            //
            //            guard let review = try? GetReviewsQuery.Data.Review(jsonObject: rawReview) else { return }
            //
            //            self.reviews.insert(review, at: 0)
            
            /// Real Time sẽ đóng cái này
            // self.isAddingReview = false
            
            /// Lưu lại cache
            /// Chỉ cần update lại cache có offset = 0
            /// Đẩy vào realtime
            //            let query = GetReviewsQuery(input: GetReviewsFilter(limit: 0, offset: 3, sort: "createdAt"))
            //            Network.store.withinReadWriteTransaction { trans in
            //                try? trans.write(data: GetReviewsQuery.Data(reviews: self.reviews), forQuery: query)
            //            }
            
        }
    }
    
    func subNotifyHandle() -> Void {
        
        /// Dừng nếu ko có story
        guard let story = story else {
            return
        }
        // fallback xoá subnotify cũ
        subReview?.cancel()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            self.subReview = Network.useApollo.subscribe(subscription: SubReviewSubscription(story: story.id)) { [weak self] result in
                guard let self = self else { return }
                
                guard let data = try? result.get().data?.subReview else { return }
                
                self.isAddingReview = false
                
                guard let review = try? GetReviewsQuery.Data.Review.init(jsonObject: data.jsonObject) else { return }
                
                self.reviews.insert(review, at: 0)
                
                
                let query = GetReviewsQuery(input: GetReviewsFilter(limit: 3, offset: 0, sort: "createdAt", story: story.id))
                
                Network.store.withinReadWriteTransaction { trans in
                    try? trans.update(query: query, { cache in
                        print("⛈ Insert new cache: \(review.jsonObject)")
                        cache.reviews = self.reviews
                    })
                    
                }
                
            }
            
        }
    }
    
}


// MARK: Support Bookmark
extension StoryViewModel {
    
    func toggleBookmark() -> Void {
        
        isBookmarking = true
        
        let input = ToogleBookmarkMutation(input: ToggleBookmarkInput(story: story!.id))
        
        Network.useApollo.perform(mutation: input) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data else { return }
            
            self.isBookmarked = data.toogleBookmark?.id != nil
            
            self.isBookmarking = false
            
        }
        
    }
    
    func checkBookmark() -> Void {
        self.isBookmarking = true
        
        let query = CheckBookmarkQuery(input: CheckBookmarkFilter(story: story!.id))
        
        Network.useApollo.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data else {
                return
            }
            
            self.isBookmarked = data.bookmark != nil
            self.isBookmarking = false
            
        }
    }
    
}

public func extractCounter(counters: [CounterBase], name: CounterName, scope: CounterScope = .total) -> CounterBase? {
    return counters.first(where: { item in
        return item.name == name && item.scope == scope
    })
}
