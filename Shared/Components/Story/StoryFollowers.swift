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
    
    @State var isReady: Bool = false
    
    @State var followers: [UserBase] = [UserBase]()
    
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
                
                VStack() {
                    if isReady {
                        GroupAvatars(users: followers)
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
            getFollowers()
        }
    }
}

extension StoryFollowers {
    func getFollowers() -> Void {
        Network.useApollo.fetch(query: GetBookmarkersQuery(filter: GetBookmarksFilter(limit: 4, offset: 0, sort: "createdAt", story: viewModel.story?.id))) { result in
            
            switch result {
            case .success(let graphQLResult):
                
                guard let data = graphQLResult.data?.bookmarks else { return }
                self.followers = data.map({ item in
                    return item.user.fragments.userBase
                })
                self.isReady = true
                
                break
            case .failure(_): break
                //
            }
            
        }
    }
}

struct StoryFollowers_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
