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
        
        GeometryReader { proxy -> AnyView in
            
            let minY = proxy.frame(in: .global).minY
            
            DispatchQueue.main.async {
                offset = minY
            }
                
                return AnyView(
                    
                    ZStack {
                        
                        Color.clear
                            .background {
                                
                                if viewModel.isReady {
                                    ImageView(viewModel.story?.avatar)
                                       .scaledToFill()
                                } else {
                                    Rectangle()
                                        .fill(Color("Placeholder"))
                                }
                                
                            }
                            .frame(height: minY > 0 ? 330 + minY : nil, alignment: .center)

                    }
                        .frame(height: minY > 0 ? 330 + minY : nil)
                        .offset(y: minY > 0 ? -minY : 0)
                    
                )
                
            }
        .frame(height: 330)
            
        }
}

struct StoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
