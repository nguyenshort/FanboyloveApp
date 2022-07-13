//
//  ViewExtentions.swift
//  comix
//
//  Created by Yuan on 13/04/2022.
//

import SwiftUI

public enum RoundingPrecision {
    case ones
    case tenths
    case hundredths
}

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
    
    func preciseRound(
        _ value: Double,
        precision: RoundingPrecision = .ones) -> Double
    {
        switch precision {
        case .ones:
            return round(value)
        case .tenths:
            return round(value * 10) / 10.0
        case .hundredths:
            return round(value * 100) / 100.0
        }
    }
    
}


extension Float {
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
