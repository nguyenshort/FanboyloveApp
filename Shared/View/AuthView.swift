//
//  AuthView.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import SwiftUIX

struct AuthView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isLogin: Bool = true
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("TextContentColor"))
                    
                }
                
                Spacer()
            }
            .padding(.vertical)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    Image("boy-motobike")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth() - 150)
                    
                    Text(isLogin ? "Đăng Nhập" : "Đăng Ký")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)

                    
                    AuthForm(isLogin: $isLogin)
                        .padding(.top, 10)
                    
                    HStack {
                        
                        Color.gray.opacity(0.2).frame(height: 1)
                        
                        Text("TIẾP TỤC VỚI")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray.opacity(0.7))
                        
                        Color.gray.opacity(0.2).frame(height: 1)

                    }
                    .padding(.vertical, 30)
                    
                    
                    SocialLogin()
                    
                    HStack {
                        
                        Text(isLogin ? "Chưa có tài khoản?" : "Đã có tài khoản?")
                            .foregroundColor(Color("TextContentColor"))
                        
                        Text(isLogin ? "Đăng ký ngay" : "Đăng nhập ngay")
                            .foregroundColor(Color("MainStartColor"))
                            .onTapGesture {
                                isLogin.toggle()
                            }
                        
                    }
                    .font(.callout)
                    .padding(.top, 20)
                    
                }
                .padding(.horizontal)
                
                
            }
            
        }
        .padding(.horizontal)
//        .background {
//            LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .top, endPoint: .b)
//                .ignoresSafeArea()
//        }
        
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            AuthView()
            
        }
        
    }
}
