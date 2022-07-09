//
//  MainView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI
import PageView

struct MainView: View {
    
    @State var showMenu: Bool = false
    @State var baseOffset: CGFloat = 280
    
    @State var pageIndex = 0
    
    var body: some View {
        
        ZStack {
            HomeView()
                .disabled(pageIndex != 0)
                .opacity(pageIndex == 0 ? 1 : 0)
            CategoriesView()
                .disabled(pageIndex != 1)
                .opacity(pageIndex == 1 ? 1 : 0)
            Color.blue
                .disabled(pageIndex != 2)
                .opacity(pageIndex == 2 ? 1 : 0)
            Color.green
                .disabled(pageIndex != 3)
                .opacity(pageIndex == 3 ? 1 : 0)
        }
        .padding(.vertical, showMenu ? 15 : 0)
        .padding(.horizontal, showMenu ? 5 : 0)
        .background {
            
            Color.white
                .cornerRadius(showMenu ? 20 : 0)
            
        }
        .scaleEffect(showMenu ? 0.9 : 1)
        .offset(x: showMenu ? baseOffset : 0)
        .overlay {
            Text("\(showMenu ? "true" : "false")")
                .onTapGesture {
                    withAnimation(.spring()) {
                        showMenu.toggle()
                    }
                }
        }
        .background {
            Color.white
                .cornerRadius(showMenu ? 20 : 0)
                .offset(x: showMenu ? baseOffset - 10 : 0)
                .scaleEffect(showMenu ? 0.83 : 1)
                .opacity(showMenu ? 0.7 : 0)
                .zIndex(0)
        }
        .background {
            Color.white
                .cornerRadius(showMenu ? 20 : 0)
                .offset(x: showMenu ? baseOffset - 55 : 0)
                .scaleEffect(showMenu ? 0.75 : 1)
                .opacity(showMenu ? 0.7 : 0)
                .zIndex(0)
        }
        .overlay(alignment: .leading) {
            MainTabView(baseOffset: baseOffset, showMenu: $showMenu, currentTab: $pageIndex)
        }
        .overlay(
            
            CloseSidebarView(showMenu: $showMenu)
            ,alignment: .topLeading
        )
        .background(
            LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .leading, endPoint: .trailing)
                .opacity( showMenu ? 1 : 0 ).ignoresSafeArea()
        )
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
