//
//  StoryInfoView.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI
import SwiftUIX
import SwiftUIFlowLayout

struct StoryInfoView: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    @State var limit: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            Text(viewModel.getName())
                .foregroundColor(Color("TextColor"))
                .font(.title)
                .fontWeight(.semibold)
                .lineLimit(2)
                    
            if viewModel.isReady {
                StoryCategories()
            } else {
                StoryCategories.preview
            }
            
            // Rating
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
                    
                    if viewModel.countRating() != 0 {
                        HStack {
                            Text("\(viewModel.ratingScore().clean)")
                                .font(.callout)
                                .fontWeight(.bold)
                            
                            Text("(\(viewModel.countRating()) Đánh giá)")
                                .font(.subheadline)
                                .foregroundColor(Color("TextContentColor"))
                        }
                    } else {
                        Text("--")
                            .foregroundColor(Color("TextContentColor"))
                    }
                    
                }
                
                Spacer()
                
                if viewModel.countRating() != 0 {
                    GroupAvatars()
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
            .padding(.top, 15)
            
            Divider()
                .padding(.vertical)
            
            HStack {
                CounterComponent(image: "discovery", label: "Năng Động")
                CounterComponent(image: "eye", label: "Lượt Xem")
                CounterComponent(image: "open-book", label: "Chương")
            }
            
            SessionBlock(title: "Tóm Tắt") {
                IntrinsicGeometryReader { proxy in
                    
                    Text(viewModel.getContent())
                        .font(.callout)
                        .lineSpacing(6)
                        .foregroundColor(Color("TextContentColor"))
                        .lineLimit( limit ? 4 : nil)
                        .onAppear {
                            
                            if proxy.size.height > 95 {
                                
                                limit = true
                                
                            }
                            
                        }
                        .onTapGesture {
                            withAnimation {
                                limit.toggle()
                            }
                        }
                    
                }
            }
            .padding(.top, 20)
            
        }
    }
    
    func ratingScore() -> String {
        return String(format: "%.1f", viewModel.ratingScore())
    }
    
    fileprivate func CounterComponent(image: String, label: String) -> some View {
        return VStack(spacing: 6) {
            
            HStack(spacing: 5) {
                
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("MainStartColor"))
                    .frame(width: 25, height: 25)
                
                Text("15K")
                    .fontWeight(.semibold)
                
            }
            
            Text(label)
                .font(.caption)
                .foregroundColor(Color("TextContentColor"))
        }
        .frame(maxWidth: .infinity)
    }
    
    static var preview: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("It is a long established")
                    .foregroundColor(Color("TextContentColor"))
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                        
                StoryCategories.preview
                
                // Rating
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
                        
                        HStack {
                            Text("**")
                                .font(.callout)
                                .fontWeight(.bold)
                            
                            Text("(** Đánh giá)")
                                .font(.subheadline)
                                .foregroundColor(Color("TextContentColor"))
                        }
                        
                    }
                    
                    Spacer()
                    
                    GroupAvatars.preview
                    
                }
                .padding(.top, 15)
                
                Divider()
                    .padding(.vertical)
                
                HStack {
                    ForEach(1...3, id: \.self) { _ in
                        
                        VStack(spacing: 6) {
                            
                            HStack(spacing: 5) {
                                
                                Image("discovery")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("MainStartColor"))
                                    .frame(width: 25, height: 25)
                                
                                Text("15K")
                                    .fontWeight(.semibold)
                                
                            }
                            
                            Text("Lượt Xem")
                                .font(.caption)
                                .foregroundColor(Color("TextContentColor"))
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                }
                
                SessionBlock(title: "Tóm Tắt") {
                    Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
                        .font(.callout)
                        .lineSpacing(6)
                        .foregroundColor(Color("TextContentColor"))
                        .lineLimit(4)
                }
                .padding(.top, 20)
                
            }
        }
    }
}

struct StoryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "can-ke-tiep-xuc-5")
            
        }
    }
}
