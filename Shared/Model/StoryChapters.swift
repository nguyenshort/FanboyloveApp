//
//  StoryChapters.swift
//  comix
//
//  Created by Yuan on 16/04/2022.
//

import SwiftUI

struct StoryChapters: Identifiable {
    var id: String = UUID().uuidString
    var story: Story
    var chapters: [Chapter]
}

let _storyChaterss: [StoryChapters] = [
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    ),
    StoryChapters(
        story: _stories.first!,
        chapters: [
            Chapter(id: "1", name: "Chapter 1 - Vừa Gặp Đã Yêu", slug: "chapter-1", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656),
            Chapter(id: "2", name: "Chapter 2", slug: "chapter-2", avatar: "https://f2.kkmh.com/image/220413/dKkAJKakg.webp-w750.jpg", createdAt: 1234567656)
        ]
    )
]
