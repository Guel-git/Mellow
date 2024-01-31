//
//  TestViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/18.
//

import UIKit

import RxSwift

final class TestViewController: BaseViewController {
    
//    var selectedAnswer: String = ""
    private let testView = TestView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()

    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
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
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> TestViewModel.Output? {
        guard let viewModel = viewModel as? TestViewModel else { return nil }
        let input = TestViewModel.Input(
            viewDidLoad: self.rx.viewDidLoad,
            answerItemTapped: testView.answerItemTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
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

extension TestViewController {
    private func bind(output: TestViewModel.Output?) {
        guard let output else { return }
        
        Observable.combineLatest(output.questionNumImage, output.questionText, output.progressRatio, output.progressRadius, output.mainButtonText, output.answerList)
            .subscribe { [weak self] questionNumImage, questionText, progressRatio, progressRadius, mainButtonText, answerList in
                self?.testView.setupAttribute(questionNumImage, questionText, progressRatio, progressRadius, mainButtonText, answerList)
            }
            .disposed(by: disposeBag)
        
        output.answerItemSelectionDidEnd
            .subscribe { [weak self] isEnabled in
                self?.testView.activateMainButton(isEnabled)
            }
            .disposed(by: disposeBag)
    }
}
