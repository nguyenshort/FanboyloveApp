//
//  ChapterToolBar.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI
import SwiftUIX

struct ChapterToolBar: View {
    
    @EnvironmentObject var viewModel: ChapterViewModel
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        HStack {
            
            Button {
                
            } label: {
                
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)

            
            Button {
                
            } label: {
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
            
            Button {
                

                
            } label: {
                
                Image(systemName: "highlighter")
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
            
            Button {
                
            } label: {
                
                Image(systemName: "text.justify")
                    .foregroundColor(.white)
                
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding(.bottom, 30)
        .padding([.horizontal, .top], 20)
        .background(Color("TextColor"))
        .animation(.easeIn, value: viewModel.showToolBar)
        .offset(y: viewModel.showToolBar ? 100 : 0)
        
    }
}

struct ChapterToolBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            ChapterView(story: _stories.first!)
            
        }
        
    }
}
