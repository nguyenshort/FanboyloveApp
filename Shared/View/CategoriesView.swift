//
//  CategoriesView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            
            CategoriesAppBarView()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    ForEach(_categoryStories) { item in
                        
                        CategoriesItemView(item: item)
                        
                    }
                    
                }
                .padding(.horizontal, 20)
                
            }
            
        }
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
