//
//  HomeAppBar.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI

struct HomeAppBar: View {
    
    @Environment(\.authKey) var auth
    @Environment(\.currentUserKey) var currentUser
    
    var body: some View {
        HStack {
            Text("Home")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextColor"))
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .trailing) {
            
            Button {
                
            } label: {
                
                Group {
                    if auth {
                        
                        ImageView(currentUser?.avatar)
                        
                    } else {
                        
                        Image("avatar")
                            .resizable()
                        
                    }
                }
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
            }
            .withAuth()
        }
        .padding()
    }
}

struct HomeAppBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeAppBar()
    }
}
