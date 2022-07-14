//
//  AuthForm.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import FirebaseAuth

struct AuthForm: View {
    
    @Binding var isLogin: Bool
    
    @State var isLoading: Bool = false
    @State var email: String = ""
    @State var password: String = ""
    
    @State var test: String = ""
    
    var canSubmit: Bool {
        get {
            
            return !isLoading && !email.isEmpty && !password.isEmpty
            
        }
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text(test)
            
            Group {
                
                if !isLogin {
                    
                    TextField("Tên Người Dùng", text: .constant(""))
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
                
                login()
                
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
        // Auth.auth().signIn(with: T##AuthCredential, completion: T##((AuthDataResult?, Error?) -> Void)?##((AuthDataResult?, Error?) -> Void)?##(AuthDataResult?, Error?) -> Void)
    }
    
}

struct AuthForm_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AuthView()
            
        }
    }
}
