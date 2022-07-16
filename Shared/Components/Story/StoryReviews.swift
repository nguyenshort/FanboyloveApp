//
//  StoryReviewsView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryReviews: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
        
    var body: some View {
        
        Group {
            
            if viewModel.isShowReviews {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TitleView(title: "Đánh Giá") {
                        
                        let countReview = extractCounter(counters: viewModel.counters, name: .review, scope: .total)
                        
                        if countReview != nil && countReview!.value > 4 {
                            Button {
                                
                                viewModel.isOpenListReviews.toggle()
                                
                            } label: {
                                
                                Text("Xem tất cả")
                                
                                Image(systemName: "arrow.right")
                                
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .sheet(isPresented: $viewModel.isOpenListReviews) {
                                ReviewsSheet()
                                    .environmentObject(viewModel)
                            }
                        }
                        
                    }
                    
                    Button {
                        
                        viewModel.isOpenAddReview.toggle()
                        
                    } label: {
                    
                        TextField("Bình luận ngay", text: .constant(""))
                            .font(.callout)
                            .foregroundColor(Color("TextColor"))
                            .padding(.vertical, 17)
                            .padding(.horizontal, 25)
                            .background(Color("Placeholder"))
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
                    .disabled(viewModel.isAddingReview)
                    .withAuth()
                    
                    
                    ReviewsList(prefix: 3)

                    
                }
                
            } else {
                StoryReviews.preview
                    .redacted(reason: .placeholder)
            }
            
        }
        .task {
            viewModel.getReviews(limit: 3)
            viewModel.subNotifyHandle()
        }
        .sheet(isPresented: $viewModel.isOpenAddReview) {
            StoryAddReview()
                .environmentObject(viewModel)
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

struct StoryReviews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
