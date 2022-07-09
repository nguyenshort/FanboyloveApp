//
//  TitleView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct TitleView<Content> : View where Content : View {
    
    var content: Content
    var title: String
    
    public init(title: String, @ViewBuilder label: () -> Content) {
        
        self.content = label()
        self.title = title
        
    }
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextColor"))
            
            Spacer()
            
            content
            
        }

        
    }
}

