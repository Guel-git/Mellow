//
//  SleepType.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import UIKit

enum SleepType: Character {
    case Best = "0"
    case Zombie = "1"
    case Baby = "2"
    case Nervous = "3"
    
    var typeText: String {
        switch self {
        case .Best:
            return TextLiteral.ResultView.bestTypeText
        case .Zombie:
            return TextLiteral.ResultView.zombieTypeText
        case .Baby:
            return TextLiteral.ResultView.babyTypeText
        case .Nervous:
            return TextLiteral.ResultView.nervousTypeText
        }
    }
    
    var typeImage: UIImage {
        switch self {
        case .Best:
            return ImageLiteral.bestEmoji
        case .Zombie:
            return ImageLiteral.zombieEmoji
        case .Baby:
            return ImageLiteral.babyEmoji
        case .Nervous:
            return ImageLiteral.nervousEmoji
        }
    }
    
    var angelText: String {
        switch self {
        case .Best:
            return TextLiteral.ResultView.bestAngelText
        case .Zombie:
            return TextLiteral.ResultView.zombieAngelText
        case .Baby:
            return TextLiteral.ResultView.babyAngelText
        case .Nervous:
            return TextLiteral.ResultView.nervousAngelText
        }
    }
    
    var favoriteText: String {
        switch self {
        case .Best:
            return TextLiteral.ResultView.bestFavoriteText
        case .Zombie:
            return TextLiteral.ResultView.zombieFavoriteText
        case .Baby:
            return TextLiteral.ResultView.babyFavoriteText
        case .Nervous:
            return TextLiteral.ResultView.nervousFavoriteText
        }
    }
    
    var contentText: String {
        switch self {
        case .Best:
            return TextLiteral.ResultView.bestContentText
        case .Zombie:
            return TextLiteral.ResultView.zombieContentText
        case .Baby:
            return TextLiteral.ResultView.babyContentText
        case .Nervous:
            return TextLiteral.ResultView.nervousContentText
        }
    }
    
    var routineBeforeArray: [String] {
        switch self {
        case .Best, .Baby:
            return TextLiteral.ResultView.shortRoutineBeforeArray
        case .Zombie, .Nervous:
            return TextLiteral.ResultView.longRoutineBeforeArray
        }
    }
    
    var routineAfterArray: [String] {
        switch self {
        case .Best, .Baby:
            return TextLiteral.ResultView.shortRoutineAfterArray
        case .Zombie, .Nervous:
            return TextLiteral.ResultView.longRoutineAfterArray
        }
    }
    
    var routineBeforeImage: [UIImage] {
        switch self {
        case .Best, .Baby:
            return ImageLiteral.shortRoutineBeforeImage
        case .Zombie, .Nervous:
            return ImageLiteral.longRoutineBeforeImage
        }
    }
    
    var routineAfterImage: [UIImage] {
        switch self {
        case .Best, .Baby:
            return ImageLiteral.shortRoutineAfterImage
        case .Zombie, .Nervous:
            return ImageLiteral.longRoutineAfterImage
        }
    }
    
    var routineBeforeTime: [String] {
        switch self {
        case .Best, .Baby:
            return ["210", "60"]
        case .Zombie, .Nervous:
            return ["210", "60", "30"]
        }
    }
    
    var routineAfterTime: [String] {
        switch self {
        case .Best, .Baby:
            return ["60"]
        case .Zombie, .Nervous:
            return ["60", "60"]
        }
    }
    
    var routineTableViewHeight: Int {
        switch self {
        case .Best, .Baby:
            return 375
        case .Zombie, .Nervous:
            return 495
        }
    }
    
    var routineDetailViewHeight: Int {
        switch self {
        case .Best, .Baby:
            return 176
        case .Zombie, .Nervous:
            return 264
        }
    }
}
