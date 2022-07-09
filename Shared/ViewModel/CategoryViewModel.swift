//
//  CategoryViewModel.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    
    @Published var category: Category?
    
    @Published var offset: CGFloat = .zero
    
    @Published var sort: SortOption = .UpdatedAt
    
}
