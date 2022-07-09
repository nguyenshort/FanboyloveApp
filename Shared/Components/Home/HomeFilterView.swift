//
//  HomeFilterView.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

struct HomeFilterView: View {
    
    var body: some View {
        HStack(spacing: 18) {
        
            
            Menu {
                
                ForEach(_categories) { category in
                    
                    Button {
                        
                    } label: {
                        
                        Text(category.name)
                            .font(.subheadline)
                        
                    }

                    
                }
                
            } label: {
                
                HStack {
                    
                    Text("Thể Loại")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.caption)
                    
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color("Color2"))
                .cornerRadius(20)
                
            }
            .frame(maxWidth: 160)
            .accentColor(Color("TextColor"))
            
            Menu {
                
                ForEach(_categories) { category in
                    
                    Button {
                        
                    } label: {
                        
                        Text(category.name)
                            .font(.subheadline)
                        
                    }

                    
                }
                
            } label: {
                
                HStack {
                    
                    Text("Thể Loại")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.caption)
                    
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 20)
                .background(Color("Color2"))
                .cornerRadius(20)
                
            }
            .frame(maxWidth: 160)
            .accentColor(Color("TextColor"))

            
        }
    }
}

struct HomeFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
