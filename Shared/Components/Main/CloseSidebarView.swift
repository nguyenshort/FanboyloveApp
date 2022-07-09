//
//  CloseSidebarView.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 09/07/2022.
//

import SwiftUI

struct CloseSidebarView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        Button {
            
            withAnimation(.spring()) {
                showMenu.toggle()
            }
            
        } label: {
            ZStack {
                //                     .foregroundColor(Color("TextColor"))
                RoundedRectangle(cornerRadius: 5)
                    .fill(showMenu ?.white : Color("TextColor"))
                    .frame(width: showMenu ? 32 : 21, height: showMenu ? 3 : 2)
                    .rotationEffect(showMenu ? .degrees(45) : .zero, anchor: .topLeading)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(showMenu ?.white : Color("TextColor"))
                    .frame(width: 21, height: 2)
                    .offset(x: 3, y: 10)
                    .opacity(showMenu ? 0 : 1)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(showMenu ?.white : Color("TextColor"))
                    .frame(width: showMenu ? 32 : 21, height: showMenu ? 3 : 2)
                    .rotationEffect(showMenu ? .degrees(-45) : .zero, anchor: .bottomLeading)
                    .offset(y: 20)
                Color.clear
                    .frame(width: 32, height: 32)
            }
        }
        .offset(x: 23)
    }
}

struct CloseSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
