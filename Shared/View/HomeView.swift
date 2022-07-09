//
//  HomeView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Home")
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .trailing) {
                Button {
                    
                } label: {
                    
                    ImageView("https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ")
                        .scaledToFill()
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                    
                }
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    
                    HomeSearchView()
                    
                    HomeBannerView()
                    
                    HomeCategoriesView()
                        .padding(.top, 5)
                    
                    HomeTopViewsView()
                    
                    HomeCompletedView()
                    
                    
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
        ContentView()
    }
}
