//
//  Chapter.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct Chapter: Identifiable {
    let id: String
    var name: String
    var slug: String
    var avatar: String?
    var createdAt: Int
}

let _chapters: [Chapter] = [
    Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
    Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
    Chapter(id: "3", name: "Chapter 3", slug: "chapter-3", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
    Chapter(id: "4", name: "Chapter 4", slug: "chapter-4", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
    Chapter(id: "5", name: "Chapter 5", slug: "chapter-5", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
]
