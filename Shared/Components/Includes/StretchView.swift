//
//  StretchView.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI
import SwiftUIX

struct StretchView<Content> : View where Content : View {
    
    var image: String
    var height: CGFloat
    var content: Content
    
    @State var offset: CGFloat = .zero
    
    public init(image: String, height: CGFloat = 350, @ViewBuilder label: () -> Content) {
    
        self.height = height
        self.image = image
        self.content = label()
        
    }
    
    var body: some View {
        
        IntrinsicGeometryReader { proxy in
            
           
            Color.clear
                .frame(height: height + offsetHeight())
                .background {
                    
                    ImageView(image)
                       .scaledToFill()
                    
                }
                .overlay(
                    
                    content
                
                )
                .clipped()
                .offset(y: offsetY())
                .onChange(of: proxy.frame(in: .global).minY) { newValue in
                    offset = newValue
                }
                
            
        }
        
    }
    
    func offsetHeight() -> CGFloat {
        return offset > 0 ? offset : .zero
    }
    
    func offsetY() -> CGFloat {
        return -offset
    }
}

struct StretchView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
