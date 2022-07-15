//
//  StoryFollowers.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 14/07/2022.
//

import SwiftUI
import Apollo

struct StoryFollowers: View {
    @EnvironmentObject var viewModel: StoryViewModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 6) {
                    
                    ForEach(0..<5, id: \.self) { _ in
                        Image("star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                    }
                    
                }
                
                if countReview() != 0 {
                    HStack {
                        Text("4.3")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Text("(\(countReview()) Đánh giá)")
                            .font(.subheadline)
                            .foregroundColor(Color("TextContentColor"))
                    }
                } else {
                    Text("--")
                        .foregroundColor(Color("TextContentColor"))
                }
                
            }
            
            Spacer()
            
            if countReview() != 0 {
                
                VStack() {
                    if viewModel.isShowFollowers {
                        GroupAvatars(users: viewModel.followers)
                    } else {
                        GroupAvatars.preview
                            .redacted(reason: .placeholder)
                    }
                }
                
            } else {
                
                Button {
                    
                } label: {
                    
                    Text("+ Đánh Giá")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color("MainStartColor"))
                        .cornerRadius(20)
                        .shadow(color: Color("MainStartColor").opacity(0.3), radius: 4, x: 0, y: 0)
                    
                }
                
                
            }
            
        }
        .task {
            viewModel.getFollowers()
        }
    }
    
    
    func countReview() -> Int {
        return extractCounter(counters: viewModel.counters, name: .review)?.value ?? 0
    }
}

struct StoryFollowers_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
