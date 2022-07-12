//
//  HomeCategoriesView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import Apollo

struct HomeCategories: View {
    
    @State var categories: [CategoryBase] = [CategoryBase]()
    
    let setSomeCategories: (_ categories: [CategoryBase]) -> Void
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            if categories.isEmpty {
                
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
                    ForEach(categories, id: \.id) { category in
                        
                        Button {
                            
                        } label: {
                            
                            Text(category.name)
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
            getCategories()
        }
        
    }
}

extension HomeCategories {
    func getCategories() -> Void {
        Network.useApollo.fetch(query: GetCategoriesQuery()) { result in
            switch result {
              case .success(let graphQLResult):
                DispatchQueue.main.async {
                    self.categories = (graphQLResult.data?.categories ?? []).map({ item in
                        return item.fragments.categoryBase
                    })
                    self.setSomeCategories(self.categories)
                }
                break
            case .failure(_): break
                //
              }
        }
    }
}

struct HomeCategories_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
