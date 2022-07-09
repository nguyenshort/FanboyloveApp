//
//  ChapterAppBarView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct ChapterAppBarView: View {
    
    @EnvironmentObject var viewModel: ChapterViewModel
    
    var body: some View {
        
        HStack {
            
            Button {
                
            } label: {
                
                Image(systemName: "arrow.backward")
                    // .font(.title3)
                
            }
                        
            Text("Chạm Vào Giai Điệu")
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            Spacer()
            
            Button {
                
            } label: {
                
                Image(systemName: "paperplane")
                    // .font(.title3)
                
            }

            
            
        }
        .padding(.top)
        .padding(.top, 30)
        .padding([.horizontal, .bottom], 20)
        .background(Color("TextColor"))
        .foregroundColor(.white)
        .animation(.easeIn, value: viewModel.showToolBar)
        .offset(y: viewModel.showToolBar ? -100 : 0)
        
    }
}

struct ChapterAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            ChapterView(story: _stories.first!)
            
        }
        
    }
}
