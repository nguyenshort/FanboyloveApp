//
//  StoryStretchView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryStretchView: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    var body: some View {
        
        IntrinsicGeometryReader { proxy in
            
           
            Color.clear
                .frame(height: 350 + offsetHeight())
                .background {
                    
                    ImageView("https://i.imgur.com/tE4FCAJ.jpg")
                        .scaledToFill()
                    
                }
                .clipped()
                .offset(y: offsetY())
                .onChange(of: proxy.frame(in: .global).minY) { newValue in
                    viewModel.offset = newValue
                }
                
            
        }
        
    }
    
    func offsetHeight() -> CGFloat {
        return viewModel.offset > 0 ? viewModel.offset : .zero
    }
    
    func offsetY() -> CGFloat {
        return -viewModel.offset
    }
    
}

struct StoryStretchView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
