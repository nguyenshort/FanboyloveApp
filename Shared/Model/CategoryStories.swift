//
//  CategoryStories.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct CategoryStories: Identifiable {
    let id = UUID().uuidString
    let category: Category1
    let stories: [Story1]
}

let _categoryStories: [CategoryStories] = [

    CategoryStories(
        category: _categories.first!,
        stories: Array<Story1>(_stories.prefix(3))
    ),
    CategoryStories(
        category: _categories.first!,
        stories: Array<Story1>(_stories.prefix(3))
    ),
    CategoryStories(
        category: _categories.first!,
        stories: Array<Story1>(_stories.prefix(3))
    )
    
]
