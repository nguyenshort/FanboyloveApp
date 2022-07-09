//
//  StoryReviewsView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryReviewsView: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Đánh Giá") {
                
                Button {
                    
                } label: {
                    
                    Text("Xem tất cả")
                    
                    Image(systemName: "arrow.right")
                    
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
            }
            
            Button {
                
                showSheet.toggle()
                
            } label: {
            
                TextField("Bình luận ngay", text: .constant(""))
                    .font(.callout)
                    .foregroundColor(Color("TextColor"))
                    .padding(.vertical, 17)
                    .padding(.horizontal, 25)
                    .background(Color("Color2"))
                    .cornerRadius(40)
                    .overlay(
                    
                        Image(systemName: "paperplane")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                            .offset(x: -20)
                        
                        ,alignment: .trailing
                        
                    )
                    .disabled(true)
                    .accentColor(Color("TextColor"))
                
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showSheet) {
                
                Text("123456789")
                
            }
            
            
            VStack(spacing: 30) {
                
                ForEach(_reviews) { review in
                    
                    VStack(spacing: 10) {
                        
                        HStack(spacing: 10) {
                            
                            ImageView("https://lh3.googleusercontent.com/ogw/ADea4I5v7BxfpIZM29kxVScZ_7Kg6nH7XgovzklB0MzQ")
                                .frame(width: 46, height: 46)
                                .cornerRadius(46)
                                .overlay(
                                    
                                    Circle()
                                        .stroke(Color("MainStartColor"), lineWidth: 2)
                                
                                )
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text(review.user.name)
                                    .font(.callout)
                                    .lineLimit(1)
                                
                                Text("14/04/2022")
                                    .font(.subheadline)
                                    .foregroundColor(Color("TextContentColor"))
                                
                            }
                            
                            Spacer()
                            
                        }
                        
                        Text(review.content)
                            .foregroundColor(Color("TextContentColor"))
                            .lineSpacing(5)
                        
                        
                    }
                    
                }
                
            }

            
        }
        
    }
}

struct StoryReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
