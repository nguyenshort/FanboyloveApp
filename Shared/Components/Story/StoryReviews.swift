//
//  StoryReviewsView.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

struct StoryReviews: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    @State var progess: CGFloat = .zero
    @State var showProgess: Bool = false
        
    var body: some View {
        
        Group {
            
            if viewModel.isShowReviews {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    TitleView(title: "Đánh Giá") {
                        
                        let countReview = extractCounter(counters: viewModel.counters, name: .review, scope: .total)
                        
                        if countReview != nil {
                            Button {
                                
                                viewModel.isOpenListReviews.toggle()
                                
                            } label: {
                                
                                Text("Xem tất cả")
                                
                                Image(systemName: "arrow.right")
                                
                            }
                            .font(.caption)
                            .foregroundColor(.secondary)
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
                    .disabled(viewModel.isAddingReview)
                    .withAuth()
                    
                    
                    if viewModel.reviews.isEmpty {
                        
                        EmptySession()
                            .frame(height: 250)
                        
                    } else {
                        
                        VStack(spacing: 30) {
                            
                            
                            if showProgess {
                                
                                Group {
                                    
                                    ProgessBar(progess: $progess, auto: true)
                        
                                                            
                                    ReviewItem.preview
                                        .redacted(reason: .placeholder)
                                    
                                }
                            }
                            
                            ForEach(viewModel.reviews.prefix(3), id: \.id) { review in
                                
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
            viewModel.getReviews()
        }
        .sheet(isPresented: $viewModel.isOpenAddReview) {
            StoryAddReview()
                .environmentObject(viewModel)
        }
        .onChange(of: viewModel.isAddingReview) { isAdding in
            /// Nếu đang thêm thì kích hoạt progess
            if isAdding {
                progess = 0
                withAnimation {
                    showProgess = true
                }
            } else {
                withAnimation {
                    showProgess = false
                }
            }
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
