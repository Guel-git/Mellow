//
//  ImageLiteral.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/26.
//

import UIKit

enum ImageLiteral {
    
    // MARK: - symbol
    
    static var questionOneImage: UIImage { .load(systemName: "1.circle.fill") }
    static var questionTwoImage: UIImage { .load(systemName: "2.circle.fill") }
    static var questionThreeImage: UIImage { .load(systemName: "3.circle.fill") }
    static var questionFourImage: UIImage { .load(systemName: "4.circle.fill") }
    static var answerCheckImage: UIImage { .load(systemName: "checkmark.circle.fill") }
    static var mainButtonChevronImage: UIImage { .load(systemName: "chevron.right") }
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
    
    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName) else {
            return UIImage()
        }
        image.accessibilityIdentifier = systemName
        return image
    }
}
