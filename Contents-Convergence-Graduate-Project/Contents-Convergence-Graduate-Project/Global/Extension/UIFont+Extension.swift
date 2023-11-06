//
//  UIFont+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/23.
//

import UIKit

enum AppFontName: String {
    case regular = "Pretendard-Regular"
    case bold = "Pretendard-Bold"
    case medium = "Pretendard-Medium"
    case semiBold = "Pretendard-SemiBold"
    case light = "Pretendard-Light"
}

extension UIFont {
    static func font(_ style: AppFontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
    
    // MARK: - header
    static var sb20: UIFont {
        return font(.semiBold, ofSize: 20)
    }
    static var sb16: UIFont {
        return font(.semiBold, ofSize: 16)
    }
    static var sb24: UIFont {
        return font(.semiBold, ofSize: 24)
    }
    static var sb30: UIFont {
        return font(.semiBold, ofSize: 30)
    }
    static var m24: UIFont {
        return font(.regular, ofSize: 24)
    }
    
    // MARK: - body
    static var m16: UIFont {
        return font(.medium, ofSize: 16)
    }
    static var m18: UIFont {
        return font(.medium, ofSize: 18)
    }
    static var r20: UIFont {
        return font(.regular, ofSize: 20)
    }
    
    // MARK: - caption
    static var sb12: UIFont {
        return font(.semiBold, ofSize: 12)
    }
}
