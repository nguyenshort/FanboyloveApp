//
//  CategoryStretchView.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI

struct CategoryStretchView: View {
    
    var category: Category
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CategoryStretchView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            CategoryView(category: _categories.first!)
            
        }
        
    }
}
