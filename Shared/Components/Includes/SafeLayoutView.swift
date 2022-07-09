//
//  SafeLayoutView.swift
//  comix
//
//  Created by Yuan on 16/04/2022.
//

import SwiftUI
import SwiftUIX

struct SafeLayoutView<Content> : View where Content : View {
    
    var content: Content
    @Binding var offset: CGFloat
    
    public init(offset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        
        self._offset = offset
        self.content = content()
        
    }
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
            IntrinsicGeometryReader { proxy in
                
                content
                    .onChange(of: proxy.frame(in: .global).minY) { newValue in
                        self.offset = newValue
                    }
                
            }
            
        }
        
    }
}
struct SafeLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SafeLayoutView(offset: .constant(0)) {
            
            Color.blue
                .frame(height: 1300)
            
        }
    }
}
