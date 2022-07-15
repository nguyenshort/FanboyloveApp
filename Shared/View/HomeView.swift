//
//  HomeView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @State var categories: [CategoryBase] = []
    
    var body: some View {
        VStack {
            
            HomeAppBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    
                    HomeSearchView()
                    
                    HomeBannerView()
                    
                    HomeCategories()
                    .padding(.top, 5)
                    
                    HomeTopViews()
                    
                    HomeCompleted()
                        .padding(.top, 10)
                    
                    if viewModel.category != nil {
                        HomeCategory(category: viewModel.category!)
                    }
                    
                    
                }
                .padding(.horizontal, 20)
                
            }
            .background(Color.white)
            
        }
        .environmentObject(viewModel)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            HomeView()
            
        }
        
    }
}
