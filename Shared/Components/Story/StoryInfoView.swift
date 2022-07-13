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
                    
                    HStack {
                        Text("4.7")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Text("(127 Reviews)")
                            .font(.subheadline)
                            .foregroundColor(Color("TextContentColor"))
                    }
                    
                }
                
                Spacer()
                
                StoryFlowers()
                
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
                    
                }
            }
            .padding(.top, 20)
            
        }
        .redacted(reason: viewModel.isReady ? [] : .placeholder)
        
    }
}

struct StoryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
