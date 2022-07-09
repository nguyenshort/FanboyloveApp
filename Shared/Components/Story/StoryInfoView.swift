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
        
        VStack(alignment: .leading, spacing: 15) {
            
            HStack {
                
                Text(viewModel.story?.name ?? "")
                    .foregroundColor(Color("TextColor"))
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                
                Spacer()
                
                // Mỗi avatar sẽ là 34 x 34
                // sẽ xếp chồng 1/2 => 34/2 * length
                ZStack {
                    
                    ForEach(0..<_bookmarkers.count, id: \.self) { index in
                        
                        ImageView(_bookmarkers[index].avatar)
                            .scaledToFill()
                            .frame(width: 34, height: 34)
                            .cornerRadius(34)
                            .overlay(
                                
                                Circle()
                                    .stroke(Color("TextColor").opacity(0.2), lineWidth: 2)
                                
                            )
                            .shadow(color: .black.opacity(0.03), radius: 3, x: 0, y: 0)
                            .offset(x: -CGFloat(index * 34/2))
                            .zIndex(Double(_bookmarkers.count - index))
                        
                    }
                    
                }
                .frame(width: CGFloat((_bookmarkers.count - 2) * (34/2)))
                
            }
            
            HStack {
                
                Text("130 Lượt xem")
                
                Spacer()
                
                Text("34 sưu tập")
                    .font(.subheadline)
                    .opacity(0.7)
                
            }
            .font(.callout)
            .foregroundColor(Color("TextContentColor"))
            
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
                
            }
            
            FlowLayout(mode: .vstack,
                           items: ["Đam Mỹ", "Học Đường", "Rùng Rợn"],
                           itemSpacing: 0) { item in
                Button {
                    
                } label: {
                    
                    Text( "#" + item)
                        .foregroundColor(Color("MainStartColor"))
                        .font(.callout)
                    
                }
                .padding(.trailing, 8)
            }
            
        }
        
    }
}

struct StoryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: _stories.first!)
    }
}
