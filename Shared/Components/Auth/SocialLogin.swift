//
//  SocialLogin.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI

struct SocialLogin: View {
    var body: some View {
        HStack(spacing: 40) {
            
            Button {
                
            } label: {
                
                Image("google")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
            }
            
            Button {
                
            } label: {
                
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
            }
            
            Button {
                
            } label: {
                
                Image("apple")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
            }

            
        }
    }
}

struct SocialLogin_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AuthView()
            
        }
    }
}
