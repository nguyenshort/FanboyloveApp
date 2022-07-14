//
//  MainViewAppBar.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct HomeAppBar: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    @EnvironmentObject var homeApp: HomeViewModel
    
    @Environment(\.authKey) var auth
    @Environment(\.currentUserKey) var currentUser
    
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
            
            Button {
                
            } label: {
                
                if auth {
                    
                    ImageView(currentUser?.avatar)
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                } else {
                    
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                }
                
            }
            .withAuth()

            
        }
        .padding(.bottom, 5)
        .padding(.horizontal, 20)
        
    }
}

struct HomeAppBar_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
