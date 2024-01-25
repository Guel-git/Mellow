//
//  TestViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/25.
//

import UIKit

import SnapKit
import RxSwift

enum QuestionNum: Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    
    var hasBackButton: Bool {
        switch self {
        case .first:
            return false
        case .second, .third, .fourth:
            return true
        }
    }
        
    var progressRatio: Double {
        switch self {
        case .first:
            return 0.25
        case .second:
            return 0.5
        case .third:
            return 0.75
        case .fourth:
            return 1.0
        }
    }
    
    var progressRadius: CACornerMask {
        switch self {
        case .first, .second, .third:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .fourth:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    var numImage: UIImage {
        switch self {
        case .first:
            return ImageLiteral.questionOneImage
        case .second:
            return ImageLiteral.questionTwoImage
        case .third:
            return ImageLiteral.questionThreeImage
        case .fourth:
            return ImageLiteral.questionFourImage
        }
    }
    
    var questionText: String {
        switch self {
        case .first:
            return TextLiteral.questionOne
        case .second:
            return TextLiteral.questionTwo
        case .third:
            return TextLiteral.questionThree
        case .fourth:
            return TextLiteral.questionFour
        }
    }
    
    var answerList: [String] {
        switch self {
        case .first:
            return TextLiteral.firstAnswerList
        case .second:
            return TextLiteral.secondAnswerList
        case .third:
            return TextLiteral.thirdAnswerList
        case .fourth:
            return TextLiteral.fourthAnswerList
        }
    }
    
    var mainButtonTitle: String {
        switch self {
        case .first, .second, .third:
            return TextLiteral.nextButtonTitle
        case .fourth:
            return TextLiteral.endTestButtonTitle
        }
    }
    
    var weightScore: [String] {
        switch self {
        case .first:
            return ["221", "00", "112", "33"]
        case .second:
            return ["00", "033", "211", "22"]
        case .third:
            return ["00", "11", "221", "33"]
        case .fourth:
            return ["00", "33", "22", "11"]
        }
    }
}

final class TestViewModel: ViewModelType {
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    struct Output {
        let questionNumImage: Observable<UIImage>
        let questionText: Observable<String>
        let progressRatio: Observable<Double>
        let progressRadius: Observable<CACornerMask>
        let mainButtonText: Observable<String>
        let answerList: Observable<[String]>
    }
    
    // MARK: - property
    
    var questionNum: QuestionNum
    var totalAnswer: String
    
    // MARK: - init
    
    init(questionNum: QuestionNum, totalAnswer: String) {
        self.questionNum = questionNum
        self.totalAnswer = totalAnswer
    }
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        let questionNumImage = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.numImage }
        
        let questionText = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.questionText }
        
        let progressRatio = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.progressRatio }
        
        let progressRadius = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.progressRadius }
        
        let mainButtonText = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.mainButtonTitle }
        
        let answerList = input.viewDidLoad
            .withUnretained(self)
            .compactMap { _ in self.questionNum.answerList }
        
        return Output(questionNumImage: questionNumImage, questionText: questionText, progressRatio: progressRatio, progressRadius: progressRadius, mainButtonText: mainButtonText, answerList: answerList)
    }
    
    // MARK: - private func
}
