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
    static var questionFiveImage: UIImage { .load(systemName: "5.circle.fill") }
    static var answerCheckImage: UIImage { .load(systemName: "checkmark.circle.fill") }
    static var mainButtonChevronImage: UIImage { .load(systemName: "chevron.right") }
    static var navigationBarBackButton: UIImage { .load(systemName: "chevron.left") }
    static var navigationBarMenuButton: UIImage { .load(systemName: "line.3.horizontal") }
    static var dotImage: UIImage { .load(systemName: "circle.fill") }
    
    // MARK: - image
    
    static var favoriteImage: UIImage { .load(name: "favorite") }
    static var bulbImage: UIImage { .load(name: "bulb") }
    static var clockImage: UIImage { .load(name: "clock") }
    static var clothesImage: UIImage { .load(name: "clothes") }
    static var drinkImage: UIImage { .load(name: "drink") }
    static var lightImage: UIImage { .load(name: "light") }
    static var phoneImage: UIImage { .load(name: "phone") }
    static var waterImage: UIImage { .load(name: "water") }
    
    static var bestEmoji: UIImage { .load(name: "bestEmoji") }
    static var babyEmoji: UIImage { .load(name: "babyEmoji") }
    static var zombieEmoji: UIImage { .load(name: "zombieEmoji") }
    static var nervousEmoji: UIImage { .load(name: "nervousEmoji") }
    
    static var shortRoutineBeforeImage = [clothesImage, waterImage]
    static var shortRoutineAfterImage = [clockImage, drinkImage]
    static var longRoutineBeforeImage = [clothesImage, waterImage, bulbImage]
    static var longRoutineAfterImage = [clockImage, lightImage, drinkImage]
    static var duringRoutineImage = [phoneImage]
    
    static var happyImage: UIImage { .load(name: "happy") }
    static var sosoImage: UIImage { .load(name: "soso") }
    static var sadImage: UIImage { .load(name: "sad") }
    
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
