//
//  GridStories.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI

struct GridStories<Content: View, Data>: View {
    
    let items: [Data]
    @ViewBuilder let viewMapping: (Data) -> Content
    
    init(items: [Data], @ViewBuilder itemView: @escaping (Data) -> Content) {
        self.items = items
        self.viewMapping = itemView
    }
    
    var body: some View {
        
        let gridColumns: [GridItem] = Array.init(repeating: GridItem(.flexible(), spacing: 15, alignment: .top), count: 3)
        
        LazyVGrid(columns: gridColumns, spacing: 20) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                viewMapping(item)
            }
        }
    }
}
