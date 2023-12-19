//
//  UIColor+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/23.
//

import UIKit

extension UIColor {
    
    // MARK: - system
    
    static var systemSub: UIColor {
        return UIColor(hex: "#F5F6FA")
    }
    static var systemBack: UIColor {
        return UIColor(hex: "D9D9D9")
    }
    static var systemMain: UIColor {
        return UIColor(hex: "B0B1B4")
    }
    static var systemDark: UIColor {
        return UIColor(hex: "5C5C5C")
    }
    static var systemCancel: UIColor {
        return UIColor(hex: "FF453A")
    }
    
    // MARK: - font
    
    static var fontBlack: UIColor {
        return UIColor(hex: "333333")
    }
    static var fontWhite: UIColor {
        return UIColor(hex: "FFFFFF")
    }
    static var fontGray: UIColor {
        return UIColor(hex: "949494")
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
