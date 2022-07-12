//
//  Story.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct Story: Identifiable {
    var id: String
    var name: String
    var slug: String
    var avatar: String
    var content: String = ""
    var countViews: Int = 0
    var countChapters: Int = 0
}

let _stories: [Story] = []
