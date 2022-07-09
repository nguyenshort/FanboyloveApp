//
//  ChapterViewModel.swift
//  comix
//
//  Created by Yuan on 14/04/2022.
//

import SwiftUI

class ChapterViewModel: ObservableObject {
    
    @Published var offset: CGFloat = .zero
    
    @Published var showToolBar: Bool = false
        
}
