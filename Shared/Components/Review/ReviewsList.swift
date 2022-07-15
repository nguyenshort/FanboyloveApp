//
//  ReviewsList.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI
import SwiftUIX

struct ReviewsList: View {
    
    typealias Action = () -> ()
    
    @EnvironmentObject var viewModel: StoryViewModel

    @State var progess: CGFloat = .zero
    @State var showProgess: Bool = false
    
    var onInfinite: Action?
    
    var prefix: Int = 0
    
    var body: some View {
        
        
        VStack {
            
            if viewModel.reviews.isEmpty {
                
                EmptySession()
                    .frame(height: 250)
                
            } else {
                
                LazyVStack(spacing: 0) {
                    
                    
                    if showProgess {
                        
                        Group {
                            
                            ProgessBar(progess: $progess, auto: true)
                
                                                    
                            ReviewItem.preview
                                .redacted(reason: .placeholder)
                            
                            Divider()
                                .padding(.vertical, 20)
                            
                        }
                    }
                    
                    if prefix > 0 {
                        
                        ForEach(viewModel.reviews.prefix(prefix), id: \.id) { review in
                            
                            ReviewItem(review: review)
                            
                            if viewModel.reviews.last?.id != review.id {
                                
                                Divider()
                                    .padding(.vertical, 20)
                                
                            }

                        }
                        
                    } else {
                        /// Infinite chỉ sử dụng trên khi ko có limit
                        ForEach(viewModel.reviews, id: \.id) { review in
                            
                            ReviewItem(review: review)
                                .onAppear {
                                    
                                    if viewModel.reviews.last?.id == review.id {
                                        onInfinite?()
                                    }
                                    
                                }
                            
                            if viewModel.reviews.last?.id != review.id {
                                
                                Divider()
                                    .padding(.vertical, 20)
                                
                            }
                        }
                    }
                    
                    /// Loading component
                    
                    
                }
                .padding(.top, 1)
                
            }
            
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
}

struct ReviewsList_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-2")
            
        }
    }
}
