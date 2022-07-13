//
//  StoryCategories.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 12/07/2022.
//

import SwiftUI
import SwiftUIFlowLayout

struct StoryCategories: View {
    
    @EnvironmentObject var viewModel: StoryViewModel
    
    var body: some View {
        FlowLayout(mode: .vstack, items: getCategories(), itemSpacing: 0) { item in
            Button {
                
            } label: {
                
                Text( "#" + item.name)
                    .foregroundColor(Color("MainStartColor"))
                    .font(.callout)
                
            }
            .padding(.trailing, 8)
        }
    }
    
    static var preview: some View {
        FlowLayout(mode: .vstack, items: ["Đam Mỹ", "Học Đường", "Rùng Rợn"], itemSpacing: 0) { item in
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

extension StoryCategories {
    func getCategories() -> [CategoryBase] {
        return (self.viewModel.story?.categories ?? []).map({ item in
            return item.fragments.categoryBase
        })
    }
}

struct StoryCategories_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            StoryView(slug: "cham-vao-giai-dieu")
            
        }
    }
}
