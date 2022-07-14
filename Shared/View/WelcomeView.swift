//
//  WelcomeView.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import PageView
import SwiftUIX

struct WelcomeView: View {
    
    @State var currentIndex = 0
    
    @State var offset: CGFloat = .zero
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        
        WelcomeKids(offset: $offset)
        .background(alignment: .top) {
            
            WelcomeCrop(currentIndex: $currentIndex)

        }
        .background {
            
            Color(_onBoardings[currentIndex].color)
                .animation(.linear, value: currentIndex)
                .ignoresSafeArea()
            
        }
        .onChange(of: offset) { value in
            DispatchQueue.main.async {
                
                let process = value / screenWidth()
                
                DispatchQueue.main.async {
                    currentIndex = Int(process)
                }
                
            }
        }
        .overlay(alignment: .bottom) {
            
            WelcomeActions(currentIndex: $currentIndex, offset: $offset)
            .padding(.horizontal, 50)
            
        }
        .overlay(alignment: .topTrailing) {
            
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Text("Bỏ qua")
                    .foregroundColor(.white)
                
            }
            .offset(x: -30, y: 20)

            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            WelcomeView()
            
        }
    }
}



