//
//  Review.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct Review: Identifiable {
    
    let id: String
    var content: String
    var rating: Int
    var user: User
    var createdAt: Int
}

let _reviews: [Review] = [
    Review(id: "1", content: "It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.", rating: 20, user: _bookmarkers[0], createdAt: 12345432),
    Review(id: "2", content: "It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.", rating: 20, user: _bookmarkers[0], createdAt: 12345432),
    Review(id: "3", content: "It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.", rating: 20, user: _bookmarkers[0], createdAt: 12345432)
]
