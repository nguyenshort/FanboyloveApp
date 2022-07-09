//
//  MainViewAppBar.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct HomeAppBarView: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    @EnvironmentObject var homeApp: HomeViewModel
    
    @Namespace var animation
    
    var body: some View {
        
        HStack {
            
            Button {
                
                withAnimation(.spring()) {
                    mainApp.showMenu.toggle()
                }
                
            } label: {
                
                Image(systemName: "line.3.horizontal")
                    .font(.title3)
                
            }
            .foregroundColor(.primary)

            
            Spacer()
            
            Spacer()
            
            Button {
                
            } label: {
                
                ImageView("https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ")
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
            }

            
        }
        .padding(.bottom, 5)
        .padding(.horizontal, 20)
        
    }
}

struct HomeAppBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
