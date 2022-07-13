//
//  StoryViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

class StoryViewModel: ObservableObject {
    
    @Published var story: GetStoryQuery.Data.Story?
    
    // Show data hoặc placeholder
    @Published var isReady: Bool = false
    
    @Published var story1: Story1?
    
    @Published var offset: CGFloat = .zero
    
    // Dữ liệu chương
    @Published var isReadyChapters: Bool = false
    @Published var chapters: [GetChaptersQuery.Data.Chapter] = [GetChaptersQuery.Data.Chapter]()
    
    
    func getStory(slug: String) -> Void {
        isReady = false
        Network.useApollo.fetch(query: GetStoryQuery(slug: slug)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                if graphQLResult.data?.story != nil {
                    self.story = graphQLResult.data?.story
                    withAnimation {
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
    
    
    func getChapters() -> Void {
        Network.useApollo.fetch(query: GetChaptersQuery(filter: GetChaptersFilter(limit: 5, sort: "order", story: story?.id))) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                if graphQLResult.data?.chapters != nil {
                    self.chapters = graphQLResult.data!.chapters
                    withAnimation {
                        self.isReadyChapters = true
                    }
                }
                
                break
            case .failure(_): break
                //
            }
            
        }
    }
    
    func extractCounter(name: CounterName, scope: CounterScope) -> CounterBase? {
        return story?.counter.first(where: { item in
            return item.fragments.counterBase.name == name && item.fragments.counterBase.scope == scope
        })?.fragments.counterBase
    }
}
