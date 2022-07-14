//
//  AuthForm.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import FirebaseAuth

struct AuthForm: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    @Binding var isLogin: Bool
    
    @State var isLoading: Bool = false
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var canSubmit: Bool {
        get {
            
            if isLogin {
                return !isLoading && !email.isEmpty && !password.isEmpty
            }
            
            return !isLoading && !email.isEmpty && !password.isEmpty && !name.isEmpty
            
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Group {
                
                if !isLogin {
                    
                    TextField("Tên Người Dùng", text: $name)
                        .font(.callout)
                        .foregroundColor(Color("TextContentColor"))
                        .padding(.vertical, 17)
                        .padding(.horizontal, 25)
                        .padding(.leading, 30)
                        .overlay(alignment: .leading) {
                            
                            Image("Profile")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("TextContentColor"))
                                .offset(x: 15)
                            
                        }
                        .background(Color("Placeholder"))
                        .cornerRadius(20)
                        .accentColor(Color("TextContentColor"))
                    
                }
                
            }
            .animation(.linear, value: isLogin)
            
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textContentType(.emailAddress)
                .font(.callout)
                .foregroundColor(Color("TextContentColor"))
                .padding(.vertical, 17)
                .padding(.horizontal, 25)
                .padding(.leading, 30)
                .overlay(alignment: .leading) {
                    
                    Image("Message")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("TextContentColor"))
                        .offset(x: 15)
                    
                }
                .background(Color("Placeholder"))
                .cornerRadius(20)
                .accentColor(Color("TextContentColor"))
                        
            SecureField("Email", text: $password)
                .font(.callout)
                .foregroundColor(Color("TextContentColor"))
                .padding(.vertical, 17)
                .padding(.horizontal, 25)
                .padding(.leading, 30)
                .overlay(alignment: .leading) {
                    
                    Image("Lock")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color("TextContentColor"))
                        .offset(x: 15)
                    
                }
                .background(Color("Placeholder"))
                .cornerRadius(20)
                .accentColor(Color("TextContentColor"))
            
            
            Text("Forgot Password?")
                .font(.callout)
                .foregroundColor(Color("MainStartColor"))
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            Button {
                
                if isLogin {
                    login()
                } else {
                    signup()
                }
                
            } label: {
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .leading, endPoint: .trailing))
                    .frame(height: 50)
                    .overlay {
                        
                        Text(isLogin ? "Đăng Nhập" : "Đăng Ký")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                    }
                
            }
            .disabled(!canSubmit)
            .opacity(canSubmit ? 1 : 0.8)
            
            
            
        }
        
    }
}

extension AuthForm {
    
    func login() {
        self.isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                // Todo: Notify
                return
            }
            guard (result?.user) != nil else { return }
            
            self.isLoading = false
            // Todo: Add listener
            // đăng nhập thành công
        }
    }
    
    func signup() -> Void {
        self.isLoading = true
        self.viewModel.autoRefresh = false
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                // Todo: Notify
                return
            }
            guard let user = result?.user else { return }
            // Todo: Notify
            // Ddanwg kys thanhf cong
            // Cập nhật tên
            let changeRequest = user.createProfileChangeRequest()
            
            // Cập nhật tên
            changeRequest.displayName = name
            
            changeRequest.commitChanges { error in
                guard error == nil else { return }

                self.viewModel.getMe()
                self.isLoading = false
                self.viewModel.autoRefresh = true
                
            }
        }
    }
    
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AuthView()
            
        }
    }
}
