//
//  Category.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct Category: Identifiable {
    
    let id: String
    let name: String
    let slug: String
    var avatar: String?
    let content: String
    
}

let _categories: [Category] = [
    Category(id: "1", name: "Đam Mỹ", slug: "dam-my", avatar: "https://i.imgur.com/xeBVyYg.png", content: ""),
    Category(id: "2", name: "Học Đường", slug: "hoc-duong", content: ""),
    Category(id: "3", name: "Trinh Thám", slug: "trinh-tham", content: ""),
    Category(id: "4", name: "Rùng Rợn", slug: "rung-ron", content: "")
]
