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
    func formatTime(timestap: Double) -> String {
        
        let date = Date.init(timeIntervalSince1970: TimeInterval(timestap) / 1000)
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
}

/// Error Form
extension View {
    func withErrorForm(msg: Binding<String>) -> some View {
        return self.modifier(ErrorFormMessage(msg: msg))
    }
}

struct ErrorFormMessage: ViewModifier {
    
    @Binding var msg: String
    
    func body(content: Content) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            content
            
            if !msg.isEmpty {
                
                Text(msg)
                    .font(.caption)
                    .foregroundColor(Color("Rose"))
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                msg = ""
                            }
                        }
                        
                    }
                
            }
            
        }
    }
}


extension Float {
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Int {
     func shortNumber() -> String {
         let number = Double(self)
         let thousand = number / 1000
         let million = number / 1000000
         
         if million >= 1.0 {
             return "\(Int(round(million*10)/10))M"
         }
         else if thousand >= 1.0 {
             return "\(Int(round(thousand*10)/10))K"
         }
         else {
             return "\(self)"
         }
    }
}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.1f", self) : String(self)
    }
}
