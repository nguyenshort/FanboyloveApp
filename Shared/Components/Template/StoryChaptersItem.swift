//
//  StoryChaptersItem.swift
//  comix
//
//  Created by Yuan on 16/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryChaptersItem: View {
    
    var item: StoryChapters
    
    var body: some View {
        
        IntrinsicGeometryReader { proxy in
            
            HStack(spacing: 15) {
                
                ImageView(item.story.avatar)
                    .scaledToFill()
                    .frame(width: proxy.size.width / 3, height: getHeight(proxy: proxy))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(item.story.name)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextColor"))
                        .lineLimit(2)
                    
                    HStack(spacing: 2) {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        
                        Text("4.5")
                            .foregroundColor(Color("TextColor"))
                            .padding(.leading, 5)
                        
                    }
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        ForEach(item.chapters) { chapter in
                            
                            Button {
                                
                            } label: {
                                
                                Text(chapter.name)
                                    .font(.subheadline)
                                    .foregroundColor(Color("TextColor"))
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 8)
                                    .background(Color("Color2"))
                                    .lineLimit(1)
                                    .cornerRadius(20)
                                
                            }

                            
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                }
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(height: getHeight(proxy: proxy))
            
        }
        
    }
    
    private func getHeight(proxy: IntrinsicGeometryProxy)-> CGFloat {
        return proxy.size.width / 3 * 4 / 3
    }
    
}

struct StoryChaptersItem_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            CategoryView(category: _categories.first!)
            
        }
    }
}
