//
//  Color+Ext.swift
//  AIChatCourse
//
//  Created by Akhildeep Shrivastava on 1/8/25.
//

import SwiftUI

extension Color {
    // Non-failable initializer for a Color from a hex string
    init(hex: String, defaultColor: Color = .black) {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Remove the '#' if it exists
        if cleanedHex.hasPrefix("#") {
            cleanedHex.removeFirst()
        }
        
        // Ensure the hex string is valid (6 or 8 characters)
        guard cleanedHex.count == 6 || cleanedHex.count == 8,
              let rgbValue = UInt64(cleanedHex, radix: 16) else {
            self = defaultColor
            return
        }
        
        let hasAlpha = cleanedHex.count == 8
        let divisor: Double = 255.0
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / divisor
        let green = Double((rgbValue & 0x00FF00) >> 8) / divisor
        let blue = Double(rgbValue & 0x0000FF) / divisor
        let alpha = hasAlpha ? Double((rgbValue & 0xFF000000) >> 24) / divisor : 1.0
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
    
    // Convert a Color to a hex string
    func toHex(includeAlpha: Bool = true, defaultHex: String = "#000000") -> String {
        #if canImport(UIKit)
        let uiColor = UIColor(self)
        guard let components = uiColor.cgColor.components, components.count >= 3 else {
            return defaultHex
        }
        #else
        let nsColor = NSColor(self)
        guard let components = nsColor.cgColor?.components, components.count >= 3 else {
            return defaultHex
        }
        #endif

        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components.count >= 4 ? components[3] : 1.0
        
        if includeAlpha {
            return String(
                format: "#%02X%02X%02X%02X",
                Int(alpha * 255),
                Int(red * 255),
                Int(green * 255),
                Int(blue * 255)
            )
        } else {
            return String(
                format: "#%02X%02X%02X",
                Int(red * 255),
                Int(green * 255),
                Int(blue * 255)
            )
        }
    }
}
