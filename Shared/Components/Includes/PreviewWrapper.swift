//
//  PreviewWrapper.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct PreviewWrapper<Content> : View where Content : View {
    
    var content: Content
    
    public init(@ViewBuilder label: () -> Content) {
        
        self.content = label()
        
    }
    
    var body: some View {
        
        NavigationView {
            
            content
            
        }
        .onAppear {
            
            UINavigationBar.appearance().isHidden = true
            
        }

        
    }
}
