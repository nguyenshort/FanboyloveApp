//
//  PreviewWrapper.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI
import FirebaseAuth

struct PreviewWrapper<Content> : View where Content : View {
        
    @StateObject var appViewModel: AppViewModel = AppViewModel()
    @State var handle: Any?
    
    var content: Content
    
    public init(@ViewBuilder label: () -> Content) {
        
        self.content = label()
        
    }
    
    var body: some View {
        
        NavigationView {
            
            content
                .onAppear {
                    
                    UINavigationBar.appearance().isHidden = true
                    
                }
            
        }
        .task {
            handle = Auth.auth().addStateDidChangeListener { _, user in
                let auth = user != nil
                if !auth {
                    // Đăng xuất...
                    appViewModel.logOut()
                } else {
                    user?.getIDToken() { token, error in
                        if let error = error {
                            // Handle error
                            print("getIDToken error: \(error)")
                            return
                        }
                        guard let token = token else { return }
                        
                        appViewModel.setToken(token: token)
                        
                        if appViewModel.autoRefresh {
                            appViewModel.getMe()
                        }
                    }
                }
            }
        }
        .onDisappear {
            Auth.auth().removeStateDidChangeListener(handle as! NSObjectProtocol)
        }
        .environmentObject(appViewModel)
        .environment(\.authKey, appViewModel.auth)
        .environment(\.currentUserKey, appViewModel.user)

        
    }
}
