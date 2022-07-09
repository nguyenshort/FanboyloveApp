//
//  CategoriesAppBarView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct CategoriesAppBarView: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    
    var body: some View {
        
        HStack {
            
            Spacer()
            
            
            Text("Danh Sách Thể Loại")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextColor"))
            
            
            Spacer()
            
        }
        .overlay(
            
            Button {
                
                withAnimation(.spring()) {
                    mainApp.showMenu.toggle()
                }
                
            } label: {
                
                Image(systemName: "line.3.horizontal")
                    .font(.title3)
                
            }
            .foregroundColor(.primary),
            alignment: .leading
        
        )
        .padding(.top)
        .padding(.bottom, 5)
        .padding(.horizontal, 20)
        
    }
}

struct CategoriesAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
