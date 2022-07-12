//
//  HomeViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

class HomeViewModel: ObservableObject {
    @Published var categories: [GetCategoriesQuery.Data.Category] = [GetCategoriesQuery.Data.Category]()
    @Published var topView: [HomeTopViewQuery.Data.Story] = [HomeTopViewQuery.Data.Story]()
    
    func getCategories() -> Void {
        Network.shared.apollo.fetch(query: GetCategoriesQuery()) { [weak self] result in
            guard let self = self else { return }
            switch result {
              case .success(let graphQLResult):
                if ((graphQLResult.data?.categories) != nil) {
                    self.categories = graphQLResult.data!.categories
                }
                break
            case .failure(_): break
                //
              }
        }
    }
    
    func getHomeTopView() -> Void {
        Network.useApollo.fetch(query: HomeTopViewQuery(filter: GetStoriesFilter(limit: 6, offset: 0, sort: "VIEW-TOTAL"))) { [weak self] result in
            guard let self = self else { return }
            switch result {
              case .success(let graphQLResult):
                self.topView = graphQLResult.data?.stories ?? []
                break
            case .failure(_): break
                //
              }
        }
    }
    
}
