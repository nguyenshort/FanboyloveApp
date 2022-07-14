//
//  AuthViewModel.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import FirebaseAuth
import Apollo

class AppViewModel: ObservableObject {
    
    @Published var user: UserBase?
    @Published var autoRefresh: Bool = true
    
    var auth: Bool {
        get {
            return user != nil
        }
    }
    
    func getMe() -> Void {
        Network.useApollo.fetch(query: GetMeQuery()) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                guard let data = graphQLResult.data?.me.fragments.userBase else {
                    return
                }
                
                strongSelf.user = data
                
                break
            case .failure(_):
                break
            }
            
        }
    }
    
    func setToken(token: String) -> Void {
        UserDefaults.standard.set(token, forKey: "firebase_token")
    }
    
    func logOut() -> Void {
        user = nil
        UserDefaults.standard.removeObject(forKey: "firebase_token")
    }
}
