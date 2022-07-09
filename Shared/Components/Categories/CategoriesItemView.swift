//
//  CategoriesItemView.swift
//  comix
//
//  Created by Yuan on 15/04/2022.
//

import SwiftUI
import SwiftUIX

struct CategoriesItemView: View {
    
    var item: CategoryStories
    
    var body: some View {
        
        NavigationLink {
            
        } label: {
            
            IntrinsicGeometryReader { proxy in
                
                HStack(alignment: .top, spacing: 20) {
                    
                    StoriesPreview(stories: item.stories, proxy: proxy)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(item.category.name)
                            .font(.callout)
                            .fontWeight(.semibold)
                        
                        Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                        
                        Spacer()
                        
                        HStack {
                            
                            Image(systemName: "book.closed")
                            
                            Text("130 Truyện")
                            
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
            }
            .padding(20)
            .background(Color("CategoryStoriesBackground"))
            .cornerRadius(15)
            
        }
        .buttonStyle(PlainButtonStyle())

        
    }
    
    @ViewBuilder
    private func StoriesPreview(stories: [Story], proxy: IntrinsicGeometryProxy) -> some View {
       
        ZStack(alignment: .leading) {
            
            ForEach(0..<stories.count, id: \.self) { index in
                
                ImageView(stories[index].avatar)
                    .scaledToFill()
                    .frame(width: (proxy.size.width / 3) * 3 / 4, height: proxy.size.width / 3)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaleEffect(scaleByIndex(index: index), anchor: .trailing)
                    .offset(x: CGFloat(index * 15))
                    .zIndex(Double(stories.count - index))
                
            }
            
        }
        .frame(width: imageGroupWidth(proxy: proxy, count: stories.count), alignment: .leading)
        
    }
    
    func imageGroupWidth(proxy: IntrinsicGeometryProxy, count: Int) -> CGFloat {
        
        let baseWidth = (proxy.size.width / 3) * 3 / 4
        
        return baseWidth + CGFloat(count - 1) * 15
    }
    
    func scaleByIndex(index: Int) -> CGFloat {
        return 1 - CGFloat(index) * 0.15
    }
    
}

struct CategoriesItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
