//
//  StoryAddReview.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 15/07/2022.
//

import SwiftUI
import Apollo

struct StoryAddReview: View {
        
    var story: StoryBase
    @Binding var reviews: [ReviewInstance]
    
    @State private var show: Bool = false
    @State var points: [StarRatingPoint] = [
        StarRatingPoint(name: "Hướng Dẫn Có Tâm"),
        StarRatingPoint(name: "Món Ăn Dễ Nấu"),
        StarRatingPoint(name: "Nguyên Liệu Dễ Tìm"),
        StarRatingPoint(name: "Giá Thành Thực Hiện")
    ]
    
    @State var rating: Int = .zero
    @State var errorRating: String = ""
    
    @State var content: String = ""
    @State var errorContent: String = ""
    
    @State var isLoading: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.currentUserKey) var currentUser

    
    var body: some View {
        
        VStack(spacing: 25) {
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 25) {
                    
                    Text("Thêm đánh giá")
                        .font(.system(size: 30))
                        .foregroundColor(Color("TextColor"))
                    
                    Spacer()
                    
                    Button {
                        
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray.opacity(0.4))
                        
                    }
                    
                }
            }
            .padding(.horizontal, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 25) {
                    
                    VStack(spacing: 20) {
                        ForEach(0...3, id: \.self) { index in
                            
                            RatingOptionView(index: index, subject: points[index])
                            
                        }
                        
                        
                        HStack {
                            
                            Image(systemName: "bolt")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 14, height: 14)
                            
                            Text("Điểm đánh giá")
                                .font(.caption)
                            
                            Spacer()
                            
                        }
                        .padding()
                        .foregroundColor(Color("TextContentColor"))
                        .background(Color("Placeholder"))
                        .cornerRadius(10)
                        .overlay(
                            
                            HStack(spacing: 5) {
                                
                                Text(String(format: "%.1f", rating / 4))
                                    .font(.caption)
                                
                                Image(systemName: "star")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                
                            }
                                .padding(6)
                                .padding(.horizontal, 5)
                                .foregroundColor(.white)
                                .background(Color("MainStartColor"))
                                .cornerRadius(7)
                                .offset(x: -15)
                            
                            ,alignment: .trailing
                            
                        )
                        
                    }
                    .withErrorForm(msg: $errorRating)
                                        
                    ContentForm()
                    
                    
                    Button {
                        
                        addReview()
                        
                    } label: {
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(LinearGradient(colors: [Color("MainStartColor"), Color("MainEndColor")], startPoint: .leading, endPoint: .trailing))
                            .frame(height: 50)
                            .overlay {
                                
                                Text("Đăng Ngay")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                            }
                        
                    }
                    .opacity(isLoading ? 0.7 : 1)
                    .disabled(isLoading)
                    
                }
                
            }
            .padding(.horizontal, 25)
            
        }
        .padding(.top, 30)
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                show = true
            }
        }
        
    }
    
    @ViewBuilder
    func RatingOptionView(index: Int, subject: StarRatingPoint) -> some View {
        
        HStack {
            
            Text(subject.name)
                .font(.subheadline)
                .foregroundColor(Color("TextColor"))
            
            Spacer()
            
            HStack(spacing: 10) {
                
                ForEach(1...5, id: \.self) { item in
                    
                    Button {
                        
                        setPoint(index: index, point: item)
                        
                    } label: {
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                    }
                    .foregroundColor(subject.point >= item ? Color("MainStartColor") : Color("TextContentColor").opacity(0.3))
                    .animation(.linear, value: rating)
                    
                }
                
                
            }
            
        }
        
    }
    
    @ViewBuilder
    fileprivate func ContentForm() -> some View {
        TextEditor(text: $content)
            .frame(height: 200)
            .font(.subheadline)
            .foregroundColor(Color("TextContentColor"))
            .accentColor(Color("TextContentColor"))
            .withErrorForm(msg: $errorContent)
            .padding(20)
            .onAppear {
               UITextView.appearance().backgroundColor = .clear
            }
            .background(Color("Placeholder"))
            .cornerRadius(20)
    }
    
    func setPoint(index: Int, point: Int) -> Void {
        
        points[index].point = point
        
        rating = points.reduce(0) { $0 + $1.point }
        
    }
    
    func resetForm() -> Void {
        rating = 0
        points.enumerated().forEach({ item in
            
            points[item.offset].point = 0
            
        })
    }
    
    func addReview() -> Void {
                
        if content.count < 10 {
            errorContent = "Đánh giá phải trên 10 ký tự"
        }
        
        if points.filter({ point in return point.point == 0 }).count > 0 {
            errorRating = "Bạn phải chọn tất cả tiêu chí"
        }
        
        if !errorRating.isEmpty || !errorContent.isEmpty {
            return
        }
        
        isLoading = true
        
        Network.useApollo.perform(mutation: CreateReviewMutation(input: CreateReviewInput(content: content, rating: rating, story: story.id))) { result in
            
            guard let review = try? result.get().data?.createReview else { return }
            
            guard let user = currentUser else { return }
            
            guard let newReview = try? ReviewInstance(id: review.id, rating: review.rating, createdAt: review.createdAt, content: review.content, user: ReviewInstance.User.init(jsonObject: user.jsonObject)) else { return }
            
            reviews.insert(newReview, at: 0)
            
            isLoading = false
            
            presentationMode.wrappedValue.dismiss()
            
        }
    }
}

struct StoryAddReview_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            StoryView(slug: "can-ke-tiep-xuc-2")
        }
    }
}


struct StarRatingPoint: Identifiable {
    var id = UUID().uuidString
    let name: String
    var point: Int = 0
}
