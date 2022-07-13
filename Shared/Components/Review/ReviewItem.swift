//
//  ReviewItem.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI

struct ReviewItem: View {
    typealias ReviewInstance = GetReviewsQuery.Data.Review

    var review: ReviewInstance
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack(spacing: 10) {

                Circle()
                    .fill(Color("Placeholder"))
                    .background {
                        ImageView(review.user.fragments.userBase.avatar)
                    }
                    .frame(width: 46, height: 46)
                    .overlay(
                        
                        Circle()
                            .stroke(Color("MainStartColor"), lineWidth: 2)
                    
                    )
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(review.user.fragments.userBase.name)
                        .font(.callout)
                        .lineLimit(1)
                    
                    Text(formatTime(timestap: review.createdAt))
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
    
    public static var preview: some View {
        VStack(spacing: 10) {
            
            HStack(spacing: 10) {

                Circle()
                    .fill(Color("Placeholder"))
                    .frame(width: 46, height: 46)
                    .cornerRadius(46)
                    .overlay(
                        
                        Circle()
                            .stroke(Color("MainStartColor"), lineWidth: 2)
                    
                    )
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text("User Name Here")
                        .font(.callout)
                        .lineLimit(1)
                    
                    Text("14/04/2022")
                        .font(.subheadline)
                        .foregroundColor(Color("TextContentColor"))
                    
                }
                
                Spacer()
                
            }
            
            Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.")
                .foregroundColor(Color("TextContentColor"))
                .lineSpacing(5)
            
            
        }
    }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
