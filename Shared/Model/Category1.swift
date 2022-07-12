//
//  Category.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct Category1: Identifiable {
    
    let id: String
    let name: String
    let slug: String
    var avatar: String?
    let content: String
    
}

let _categories: [Category1] = [
    Category1(id: "1", name: "Đam Mỹ", slug: "dam-my", avatar: "https://i.imgur.com/xeBVyYg.png", content: ""),
    Category1(id: "2", name: "Học Đường", slug: "hoc-duong", content: ""),
    Category1(id: "3", name: "Trinh Thám", slug: "trinh-tham", content: ""),
    Category1(id: "4", name: "Rùng Rợn", slug: "rung-ron", content: "")
]
