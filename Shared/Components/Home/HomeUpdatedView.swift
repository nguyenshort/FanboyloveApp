//
//  HomeUpdated.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

struct HomeUpdatedView: View {
    var body: some View {
        
        VStack(spacing: 25) {
            
            ForEach(_stories) { story in
                
               StoryItemView(story: story)
                
            }
            
        }
        
    }
}

struct HomeUpdated_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
