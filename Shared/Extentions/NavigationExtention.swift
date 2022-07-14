//
//  NavigationExtention.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//

import SwiftUI

extension View {
    
    func withAuth() -> some View {
        return self.modifier(WithAuth())
    }
}

struct WithAuth: ViewModifier {
    
    @Environment(\.authKey) private var authKey
    
    func body(content: Content) -> some View {
        
        Group {
            
            if authKey {
                content
            } else {
                
                NavigationLink(destination: AuthView()) {
                    content.disabled(true)
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            
        }
        
    }
}
