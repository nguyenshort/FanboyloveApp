//
//  SessionBlock.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI

struct SessionBlock<Content> : View where Content : View {
    var content: Content
    var title: String
    
    public init(title: String, @ViewBuilder label: () -> Content) {
        
        self.content = label()
        self.title = title
        
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            content
        }
    }
}
