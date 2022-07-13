//
//  StoryHeader.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI
import SwiftUIX

struct StoryHeader: View {
    
    @Binding var offset: CGFloat
    @EnvironmentObject var viewModel: StoryViewModel

    
    var body: some View {
        Color.clear
            .frame(height: 330 + (offset > 0 ? offset : .zero))
            .background {
                
                if viewModel.isReady {
                    ImageView(viewModel.story?.avatar)
                       .scaledToFill()
                       .id(viewModel.story?.avatar)
                } else {
                    Rectangle()
                        .fill(Color("Placeholder"))
                }
                
            }
            .offset(y: -offset)
    }
}

struct StoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
