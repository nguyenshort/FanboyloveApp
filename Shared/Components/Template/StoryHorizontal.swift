//
//  StoryHorizontal.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX

struct StoryHorizontal: View {
    
    @State var story: StoryBase
    var content: String
    
    var body: some View {
        
        NavigationLink {
            
            StoryView(slug: story.slug)
            
        } label: {
            
            IntrinsicGeometryReader { proxy in
                
                HStack(alignment: .top, spacing: 18) {
                    
                    ImageView(story.avatar)
                        .scaledToFill()
                        .frame(width: proxy.size.width / 3, height: (proxy.size.width / 3) * 4 / 3)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text(story.name)
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
                        
                        Text(content)
                            .foregroundColor(.secondary)
                            .lineSpacing(3)
                            .lineLimit(3)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .frame(maxWidth: .infinity)
                
            }
            
        }
        .buttonStyle(PlainButtonStyle())


        
    }
    
    public static var preview: some View {
        VStack {
            IntrinsicGeometryReader { proxy in
                
                HStack(alignment: .top, spacing: 18) {
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.gray.opacity(0.3))
                        .frame(width: proxy.size.width / 3, height: (proxy.size.width / 3) * 4 / 3)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Story Name Placeholder")
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
                        
                        Text("Direct the client to resolve this field locally, either from the cache or local resolvers")
                            .foregroundColor(.secondary)
                            .lineSpacing(3)
                            .lineLimit(3)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .frame(maxWidth: .infinity)
                
            }
        }
    }
}

struct StoryHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension StoryCounter {
//    public var rating: Float {
//      get {
//
//          // Counter trống
//          if self.counter.isEmpty {
//              return Float(0)
//          }
//
//          let score = self.counter.first(where: { count in
//              return count.scope == .total && count.name == .reviewScore
//          })
//          let countRating = self.counter.first { count in
//              return count.scope == .total && count.name == .review
//          }
//
//          // Chưa có điểm và chưa tổng số rating hoặc 1 trong 2 bằng 0
//          if score == nil || countRating == nil || score?.value == 0 || countRating?.value == 0 {
//              return Float(0)
//          }
//
//          // Tính rating
//          return Float(0)
//      }
//    }
//}
