//
//  StringExtentions.swift
//  Fanboylove
//
//  Created by Nguyên Trần on 13/07/2022.
//

import SwiftUI
import Foundation

extension String {
    
}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.1f", self) : String(self)
    }
}
