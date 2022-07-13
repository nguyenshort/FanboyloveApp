//
//  TitleView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct TitleView<Content> : View where Content : View {
    
    var action: () -> Content?
    var title: String
    
    public init(title: String, @ViewBuilder action: @escaping () -> Content) {
        self.title = title
        self.action = action
    }
    
    public init(title: String) {
        self.title = title
        self.action = { nil }
    }
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(Color("TextContentColor"))
            
            Spacer()
            
            action()
                .foregroundColor(Color("TextContentColor"))
            
        }

        
    }
}

