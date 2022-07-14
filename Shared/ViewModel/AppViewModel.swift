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
    var auth: Bool {
        get {
            return user != nil
        }
    }
    
    func getMe(token: String) -> Void {
        
        UserDefaults.standard.set(token, forKey: "firebase_token")
        
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
    
    func logOut() -> Void {
        user = nil
    }
}
