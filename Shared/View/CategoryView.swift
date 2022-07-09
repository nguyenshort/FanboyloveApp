//
//  CategoryView.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI
import SwiftUIX

struct CategoryView: View {
    
    @StateObject var viewModel: CategoryViewModel = CategoryViewModel()
    
    var category: Category
    
    @Namespace var animation
    
    var body: some View {
        
        SafeLayoutView(offset: $viewModel.offset) {
            
            StretchView(image: "https://i.imgur.com/tE4FCAJ.jpg", height: 270) {
                
                LinearGradient(colors: [.black.opacity(0), .black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                    .overlay(
                        
                        Text(category.name)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding()
                        
                        ,alignment: .bottomLeading
                        
                    )
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
                    .lineSpacing(8)
                    .foregroundColor(.secondary)
                    .font(.callout)
                    .fixedSize(horizontal: false, vertical: true)
                
                
                TitleView(title: "130 Truyện") {
                    
                    HStack(spacing: 15) {
                        
                        _FilterButton(title: "Mới Nhất", value: .UpdatedAt)
                        
                        _FilterButton(title: "Xem Nhiều", value: .CountViews)
                        
                    }
                    
                }
                
                VStack(spacing: 20) {
                    
                    ForEach(_storyChaterss) { item in
                        
                        StoryChaptersItem(item: item)
                        
                    }
                    
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 30)
            .background(.white)
            .cornerRadius(20)
            
        }
        .overlay(
            
            SafeAppBarView(offset: $viewModel.offset, title: "Đam Mỹ", anchor: 100)
            
            ,alignment: .top
            
        )
        .ignoresSafeArea()
        
    }
    
    fileprivate func _FilterButton(title: String, value: SortOption) -> some View {
        return Button {
            
            withAnimation(.spring()) {
                viewModel.sort = value
            }
            
        } label: {
            
            Text(title)
                .foregroundColor(viewModel.sort == value ? Color("MainStartColor") : .secondary)
                .font(.callout)
            
        }
        .buttonStyle(PlainButtonStyle())
        .overlay(
        
            Group {
                
                if viewModel.sort == value {
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("MainStartColor"))
                        .frame(height: 2)
                        .offset(y: 12)
                        .matchedGeometryEffect(id: "FILTER_TAB", in: animation)
                    
                }
                
            }
            
        )
    }
    
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            CategoryView(category: _categories.first!)
            
        }
        
    }
}
