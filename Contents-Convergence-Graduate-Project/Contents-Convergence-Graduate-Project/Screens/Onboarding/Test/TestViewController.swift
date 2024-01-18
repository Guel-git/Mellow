//
//  TestViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/18.
//

import UIKit

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

final class TestViewController: BaseViewController {
    
//    var questionNum: QuestionNum
//    var selectedAnswer: String = ""
//    var totalAnswer: String
    private let testView = TestView()

    // MARK: - life cycle
    
//    init(questionNum: QuestionNum, totalAnswer: String) {
//        self.questionNum = questionNum
//        self.totalAnswer = totalAnswer
//        super.init()
//    }
//
//    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupAttribute()
//        setButtonAction()
    }
    
    // MARK: - override
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        testView.setupNavigationController(navigationController)
        testView.setupNavigationItem(navigationItem)
    }
    
//    private func setupAttribute() {
//        questionNumImage.image = questionNum.numImage
//        questionLabel.text = questionNum.questionText
//        progressBar.layoutIfNeeded()
//        progressBar.setGradient(start: .gradientPurpleStart, end: .gradientPurpleEnd)
//        progressBar.layer.masksToBounds = true
//        progressBar.layer.maskedCorners = questionNum.progressRadius
//        mainButton.title = questionNum.mainButtonTitle
//    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToNextQuestion()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
//
//    private func navigateToNextQuestion() {
//        totalAnswer += selectedAnswer
//        if questionNum.rawValue == 4 {
//            UserDefaultManager.sleepType = calculateScore().rawValue
//            let resultViewController = ResultViewController(resultType: calculateScore())
//            resultViewController.navigationItem.hidesBackButton = true
//            self.navigationController?.pushViewController(resultViewController, animated: true)
//        } else {
//            let nextNum = questionNum.rawValue + 1
//            let testViewController = TestViewController(questionNum: QuestionNum(rawValue: nextNum)!, totalAnswer: totalAnswer)
//            testViewController.navigationItem.hidesBackButton = true
//            self.navigationController?.pushViewController(testViewController, animated: true)
//        }
//    }
//
//    private func calculateScore() -> SleepType {
//        var typeDictionary: [SleepType:Int] = [.Best:0, .Zombie:0, .Baby:0, .Nervous:0]
//        for type in typeDictionary.keys {
//            typeDictionary[type] = totalAnswer.filter { $0 == Character(type.rawValue) }.count
//        }
//        if let maxType = typeDictionary.max(by: { $0.value < $1.value }) {
//            return maxType.key
//        }
//        return .Zombie
//    }
}
