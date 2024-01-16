//
//  ChatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

import RxSwift

final class ChatViewController: BaseViewController {
    
    // MARK: - property
    
    private let chatView = ChatView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = chatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setDelay()
//        setButtonAction()
        bindViewModel()
    }
    
    // MARK: - override
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        chatView.setupNavigationController(navigationController)
        chatView.setupNavigationItem(navigationItem)
    }
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> ChatViewModel.Output? {
        guard let viewModel = viewModel as? ChatViewModel else { return nil }
        let input = ChatViewModel.Input(
            viewDidLoad: self.rx.viewDidLoad
        )
        return viewModel.transform(from: input)
    }
    
//    private func setButtonAction() {
//        let firstAction = UIAction { [weak self] _ in
//            self?.didTappedNextButton(self?.firstButton.buttonText)
//        }
//        let secondAction = UIAction { [weak self] _ in
//            self?.didTappedNextButton(self?.secondButton.buttonText)
//        }
//        let thirdAction = UIAction { [weak self] _ in
//            self?.didTappedNextButton(self?.thirdButton.buttonText)
//        }
//        let fourthAction = UIAction { [weak self] _ in
//            self?.navigateToTestViewController()
//        }
//        firstButton.addAction(firstAction, for: .touchUpInside)
//        secondButton.addAction(secondAction, for: .touchUpInside)
//        thirdButton.addAction(thirdAction, for: .touchUpInside)
//        fourthButton.addAction(fourthAction, for: .touchUpInside)
//    }
//
//    private func didTappedNextButton(_ text: String?) {
//        answerLabel.text = text
//        answerLabel.isHidden = false
//        buttonStackView.isHidden = true
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            self.endView.isHidden = false
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            self.fourthButton.isHidden = false
//        }
//    }
    
//    private func setDelay() {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            self.startView.isHidden = false
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) {
//            self.buttonStackView.isHidden = false
//        }
//    }
//
//    private func navigateToTestViewController() {
//        let testViewController = TestViewController(questionNum: .first, totalAnswer: "")
//        testViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(testViewController, animated: true)
//    }
}

// MARK: - bind

extension ChatViewController {
    private func bind(output: ChatViewModel.Output?) {
        guard let output else { return }

        output.startViewDelayEnd
            .subscribe { [weak self] _ in
                self?.chatView.showStartView()
            }
            .disposed(by: disposeBag)
        
        output.buttonStackViewDelayEnd
            .subscribe { [weak self] _ in
                self?.chatView.showButtonStackView()
            }
            .disposed(by: disposeBag)
    }
}
