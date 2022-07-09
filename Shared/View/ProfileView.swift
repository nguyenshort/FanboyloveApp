//
//  ProfileView.swift
//  comix
//
//  Created by Yuan on 16/04/2022.
//

import SwiftUI
import SwiftUIX

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    
    var user: User
    
    var body: some View {
        
        SafeLayoutView(offset: $viewModel.offset) {
            
            StretchView(image: "https://i.imgur.com/tE4FCAJ.jpg", height: 200) {}
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
    
        PreviewWrapper {
            
            ProfileView(user: _bookmarkers.first!)
            
        }
        
    }
}
