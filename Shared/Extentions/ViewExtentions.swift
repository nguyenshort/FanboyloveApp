//
//  ViewExtentions.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

extension View {
    
    //func safeArea() -> UIEdgeInsets? {
    //    return UIApplication.shared.windows.first?.safeAreaInsets
    //}
    func formatTime(timestap: Double) -> String {
        
        let date = Date.init(timeIntervalSince1970: TimeInterval(timestap) / 1000)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
}
