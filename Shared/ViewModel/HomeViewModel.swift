//
//  HomeViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

class HomeViewModel: ObservableObject {
    
    // Danh sách category
    @Published var categories: [GetCategoriesQuery.Data.Category] = [GetCategoriesQuery.Data.Category]()
    @Published var isShowCategories: Bool = false
    
    
    // TopView
    @Published var topView: [StoryBase] = [StoryBase]()
    @Published var isShowTopView: Bool = false
    
}

// MARK: Support Categories
extension HomeViewModel {
    
    func getCategories() -> Void {
        Network.useApollo.fetch(query: GetCategoriesQuery()) { [weak self] result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.categories else { return }
            
            self.categories = data
            self.isShowCategories = true
        }
    }
    
}

// MARK: Support Top View
extension HomeViewModel {
    
    func getTopView() -> Void {
        
        let query: GetStoriesFilter = GetStoriesFilter(limit: 6, offset: 0, sort: "VIEW-TOTAL")
        
        Network.useApollo.fetch(query: HomeTopViewQuery(filter: query)) { [weak self]  result in
            
            guard let self = self else { return }
            
            guard let data = try? result.get().data?.stories else { return }
            
            self.topView = data.map({ item in
                return item.fragments.storyBase
            })
            self.isShowTopView = true
        }
    }
    
}
