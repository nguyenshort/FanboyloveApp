//
//  HomeSearchView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct HomeSearchView: View {
    var body: some View {
        TextField("Find your comix", text: .constant(""))
            .font(.subheadline)
            .foregroundColor(Color("TextColor"))
            .padding(.vertical, 17)
            .padding(.horizontal, 20)
            .padding(.leading, 35)
            .background(Color("Color2"))
            .cornerRadius(40)
            .overlay(
            
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20)
                    .offset(x: 20)
                
                ,alignment: .leading
                
            )
            .accentColor(Color("TextColor"))
            .padding(.top, 5)
    }
}

struct HomeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchView()
    }
}
