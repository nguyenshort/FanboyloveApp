//
//  StoryReviewsView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryReviews: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    typealias ReviewInstance = GetReviewsQuery.Data.Review
    
    @State var showSheet: Bool = false
    
    @State var reviews: [ReviewInstance] = [ReviewInstance]()
    @State var isReady: Bool = false
    
    var body: some View {
        
        Group {
            
            if isReady {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TitleView(title: "Đánh Giá") {
                        
                        if viewModel.extractCounter(name: .review, scope: .total) != nil {
                            Button {
                                
                            } label: {
                                
                                Text("Xem tất cả")
                                
                                Image(systemName: "arrow.right")
                                
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                        
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
                    .padding(.bottom, 5)
                    
                    
                    if reviews.isEmpty {
                        
                        EmptySession()
                            .frame(height: 250)
                        
                    } else {
                        
                        VStack(spacing: 30) {
                            
                            ForEach(reviews, id: \.id) { review in
                                
                                ReviewItem(review: review)

                            }
                            
                        }
                        
                    }

                    
                }
                
            } else {
                StoryReviews.preview
                    .redacted(reason: .placeholder)
            }
            
        }
        .task {
            getReviews()
        }
        .sheet(isPresented: $showSheet) {
            
            StoryAddReview(story: viewModel.story!.fragments.storyBase, reviews: $reviews)
            
        }
        
    }
    
    public static var preview: some View {
        SessionBlock(title: "Đánh Giá") {
            Button {
                
            } label: {
                
                Text("Xem tất cả")
                
                Image(systemName: "arrow.right")
                
            }
            .font(.caption)
            .foregroundColor(.secondary)
        } content: {
            VStack(spacing: 30) {
                
                ForEach(0..<3) { _index in
                    
                    ReviewItem.preview
                    
                }
                
            }
        }

    }
}

extension StoryReviews {
    func getReviews() -> Void {
        let filter = GetReviewsFilter(limit: 3, offset: 0, sort: "createdAt", story: viewModel.story?.id)
        Network.useApollo.fetch(query: GetReviewsQuery(input: filter)) { result in
            switch result {
            case .success(let graphQLResult):
                
                self.isReady = true
                
                guard let reviews = graphQLResult.data?.reviews else {
                    return
                }
                
                self.reviews = reviews
                
                break
            case .failure(_): break
                //
            }
        }
    }
}

struct StoryReviews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
