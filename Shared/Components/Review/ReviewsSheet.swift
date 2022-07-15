//
//  ReviewList.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI
import SwiftUIX

struct ReviewsSheet: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            SheetHeader(title: "Đánh Giá Truyện")
                .padding(.horizontal, 25)
            
            VStack(spacing: 25) {
                
                IntrinsicGeometryReader { proxy in
                    
                    let height = (proxy.size.width / 3) * 4 / 3
                    
                    HStack(alignment: .top, spacing: 18) {
                        
                        ImageView(viewModel.story?.avatar)
                            .scaledToFill()
                            .frame(width: proxy.size.width / 3, height: height)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(viewModel.story?.name ?? "")
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
                            
                            StoryCategories()
                            
                            Spacer()
                            
                            Button {
                                
                                viewModel.isOpenAddReview.toggle()
                                
                            } label: {
                                
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .leading, endPoint: .trailing))
                                    .frame(height: 40)
                                    .overlay {
                                        
                                        Text("Đánh Giá")
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        
                                    }
                                
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: height)
                    
                }
                
                Divider()
                
                
            }
            .padding(.horizontal, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    ReviewsList {
                        
                        // Đang chạy => dừng
                        if !viewModel.isLoadingReviews {
                            viewModel.getReviews(limit: 3)
                        }

                    }
                    
                }
                .padding(.horizontal, 25)
                
            }
        }
        .padding(.top, 25)
        .sheet(isPresented: $viewModel.isOpenAddReview) {
            StoryAddReview()
        }
        
    }
}

struct ReviewsSheet_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
        
    }
}
