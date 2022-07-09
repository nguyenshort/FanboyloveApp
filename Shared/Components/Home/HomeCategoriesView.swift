//
//  HomeCategoriesView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeCategoriesView: View {
    
    @EnvironmentObject var homeApp: HomeViewModel
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(_categories) { category in
                    
                    Button {
                        
                    } label: {
                        
                        Text(category.name)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color("Color2"))
                            .cornerRadius(20)
                        
                    }
                    
                }
                
            }
            .font(.subheadline)
            .foregroundColor(Color("TextColor"))

            
        }
        
    }
}

struct HomeCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
