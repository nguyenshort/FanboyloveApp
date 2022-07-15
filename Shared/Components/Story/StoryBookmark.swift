//
//  StoryBookmark.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI
import Apollo

struct StoryBookmark: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    @State var isLoading: Bool = false
    
    @State var isBookmarked: Bool = false
    
    @EnvironmentObject var app: AppViewModel
    
    var body: some View {
        
        Button {
            
            toggleBookmark()
            
        } label: {
            
            Circle()
                .fill(Color("Rose"))
                .frame(width: 60, height: 60)
                .opacity(isLoading ? 0.7 : 1)
                .animation(.default, value: isLoading)
                .overlay {
                    
                    if isBookmarked {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    } else {
                        Image(systemName: "bookmark")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                    }
                }
                .background {
                    Circle()
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: Color("Rose").opacity(0.1), radius: 5, x: 0, y: 0)

                }
                .disabled(isLoading)
        }
        .withAuth()
        .task {
            checkBookmark()
        }
        .onChange(of: app.auth) { _auth in
            if _auth {
                checkBookmark()
            } else {
                isBookmarked = false
            }
        }
        
    }
    
    static var preview: some View {
        
        Button {
            
            // toggleBookmark()
            
        } label: {
            
            Circle()
                .fill(Color("Rose"))
                .frame(width: 60, height: 60)
                .overlay {
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                }
                .background {
                    Circle()
                        .stroke(.white, lineWidth: 4)
                        .shadow(color: Color("Rose").opacity(0.1), radius: 5, x: 0, y: 0)

                }
                .disabled(true)
        }
        
    }
}

extension StoryBookmark {
    
    func toggleBookmark() -> Void {
        
        self.isLoading = true
        
        guard let story = viewModel.story else {
            self.isLoading = false
            return
        }
        
        Network.useApollo.perform(mutation: ToogleBookmarkMutation(input: ToggleBookmarkInput(story: story.id))) { result in
            
            guard let data = try? result.get().data else { return }
            
            self.isBookmarked = data.toogleBookmark?.id != nil
            
            self.isLoading = false
            
        }
        
    }
    
    func checkBookmark() -> Void {
        self.isLoading = true
        
        guard let story = viewModel.story else {
            self.isLoading = false
            return
        }
        
        Network.useApollo.fetch(query: CheckBookmarkQuery(input: CheckBookmarkFilter(story: story.id)), cachePolicy: .fetchIgnoringCacheData) { result in
            
            guard let data = try? result.get().data else {
                self.isLoading = false
                return
            }
            
            self.isBookmarked = data.bookmark != nil
            self.isLoading = false
            
        }
    }
    
}

struct StoryBookmark_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}

