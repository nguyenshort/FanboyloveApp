//
//  StoryViewModel.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    
    @Published var story: Story?
    
    @Published var offset: CGFloat = .zero
    
}
