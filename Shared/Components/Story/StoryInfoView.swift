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
            
            Text(viewModel.story?.name ?? "")
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
            StoryFollowers()
            .padding(.top, 15)
            
            Divider()
                .padding(.vertical)
            
            HStack {
                CounterComponent(
                    image: "compass",
                    label: "Năng Động",
                    value: viewModel.activityScore()
                )
                
                CounterComponent(
                    image: "visualization",
                    label: "Lượt Xem",
                    value: extractCounter(counters: viewModel.counters, name: .view, scope: .total)?.value ?? 0
                )
                
                CounterComponent(
                    image: "books",
                    label: "Chương",
                    value: extractCounter(counters: viewModel.counters, name: .countChapters, scope: .total)?.value ?? 0
                )
            }
            
            SessionBlock(title: "Tóm Tắt") {
                IntrinsicGeometryReader { proxy in
                    
                    Text(viewModel.story?.content ?? "")
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
    
    fileprivate func CounterComponent(image: String, label: String, value: Int) -> some View {
        return VStack(spacing: 8) {
            
            HStack(spacing: 7) {
                
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text("\(value.shortNumber())")
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
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
