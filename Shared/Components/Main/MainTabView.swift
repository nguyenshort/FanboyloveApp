//
//  MainTabView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var baseOffset: CGFloat
    @Binding var showMenu: Bool
    @Binding var currentTab: Int
    
    @Namespace var animation
    
    // let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
    
    @Environment(\.authKey) var auth
    @Environment(\.currentUserKey) var currentUser
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Group {
                if auth {
                    
                    ImageView(currentUser?.avatar)
                    
                } else {
                    Image("avatar")
                        .resizable()
                }
            }
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .padding(.top, 30)
                .padding(.horizontal, 20)
                .withAuth()
            
            Text(auth ? "" : "--")
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.title)
                .padding(.top, 5)
                .padding(.horizontal, 20)
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                MainTabBuilder(icon: "bolt.circle", tabIndex: 0, title: "Trang Chủ")
                
                MainTabBuilder(icon: "square.grid.3x3", tabIndex: 1, title: "Thể Loại")
                
                MainTabBuilder(icon: "rosette", tabIndex: 2, title: "Xếp Hạng")
                
                if auth {
                    MainTabBuilder(icon: "person", tabIndex: 3, title: "Cài Đặt")
                }
                
            }
            .padding(.top, 10)
            
            
        }
        //.padding(.horizontal, 20)
        .padding(.top, 40)
        .frame(maxWidth: baseOffset - 100, alignment: .leading)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading, spacing: 5) {
                Text("@Fanboylove")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .opacity(0.7)
                
                Text("App Version 1.0.0")
                    .font(.caption)
                    .foregroundColor(.white)
                    .opacity(0.7)
                
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
        .offset(x: showMenu ? 0 : -(baseOffset - 100))
    }
    
    
    @ViewBuilder
    func MainTabBuilder(icon: String, tabIndex: Int, title: String) -> some View {
        
        Button {
            
            withAnimation {
                
                currentTab = tabIndex
                
            }
            
        } label: {
            
            HStack {
                
                Image(systemName: icon)
                    .font(.title2)
                
                Text(title)
                    .fontWeight(.semibold)
                
            }
            .foregroundColor(currentTab != tabIndex ? .white : Color("MainStartColor"))
            .padding(.vertical, 10)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                
                Group {
                    
                    if currentTab == tabIndex {
                        
                        Color.white
                            .clipShape(BorderOnlyShape(radius: 20, corners: [.bottomRight, .topRight]))
                            .matchedGeometryEffect(id: "MAIN_TAB", in: animation)
                        
                    }
                    
                }
                
            )
            
        }
        
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
