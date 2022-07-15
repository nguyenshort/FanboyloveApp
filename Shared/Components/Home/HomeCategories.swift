//
//  HomeCategoriesView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeCategories: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            if !viewModel.isShowCategories {
                
                LazyHStack {
                    ForEach(0...5, id: \.self) { _index in
                        
                        Button {
                            
                        } label: {
                            
                            Text("Category \(_index)")
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color("Color2"))
                                .cornerRadius(20)
                            
                        }
                        .font(.subheadline)
                        .foregroundColor(Color("TextColor"))
                        .redacted(reason: .placeholder)
                        
                    }
                    
                }
                
            } else {
                
                LazyHStack {
                    ForEach(viewModel.categories, id: \.id) { category in

                        Button {

                        } label: {

                            Text(category.fragments.categoryBase.name)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color("Color2"))
                                .cornerRadius(20)

                        }
                        .font(.subheadline)
                        .foregroundColor(Color("TextColor"))

                    }

                }
                
            }

            
        }
        .task {
            viewModel.getCategories()
        }
        
    }
}

struct HomeCategories_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
