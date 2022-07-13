//
//  StoryAppBarView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryAppBar: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    @Binding var offset: CGFloat
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Image(systemName: "arrow.backward")
                
            }
            
            Group {
                
                Text("Chạm Vào Giai Điệu")
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .opacity(offset < -100 ? 1 : 0)
                    .offset(y: offset < -100 ? 0 : -20)
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "paperplane")
                    
                }
                
            }
            .redacted(reason: viewModel.isReady ? [] : .placeholder)

            
        }
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding([.top, .bottom])
        .padding(.top, 30)
        .background( offset < -100 ? Color("MainStartColor") : .clear)
        .animation(.spring(), value: offset)
        
    }
}

struct StoryAppBar_Previews: PreviewProvider {
    static var previews: some View {
        
        
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
        
    }
}
