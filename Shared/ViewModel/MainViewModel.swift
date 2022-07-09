//
//  MainViewModel.swift
//  comix
//
//  Created by Yuan on 12/04/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var showMenu: Bool = false
    
    @Published var currentTab: MainTab = .Home
    
}

enum MainTab: String {
    case Home = "bolt.circle"
    case Categories = "square.grid.3x3"
    case Ranking = "rosette"
    case Setting = "person"
}
