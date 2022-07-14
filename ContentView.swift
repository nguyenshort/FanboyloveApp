//
//  ContentView.swift
//  Shared
//
//  Created by Nguyên Trần on 08/07/2022.
//

import SwiftUI
import FirebaseAuth
import CoreData

struct ContentView: View {
    
    @StateObject var appViewModel: AppViewModel = AppViewModel()
    @State var handle: Any?
    
    var body: some View {
        NavigationView {
            AuthView()
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
                        appViewModel.getMe(token: token)
                    }
                }
            }
        }
        .onDisappear {
            Auth.auth().removeStateDidChangeListener(handle as! NSObjectProtocol)
        }
        .environmentObject(appViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
