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
        bindViewModel()
        bindView()
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
            viewDidLoad: self.rx.viewDidLoad,
            firstButtonTapped: chatView.firstButtonTapPublisher,
            secondButtonTapped: chatView.secondButtonTapPublisher,
            thirdButtonTapped: chatView.thirdButtonTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func bindView() {
        chatView.nextButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.navigateToTestViewController()
            }
            .disposed(by: disposeBag)
    }
    
    private func navigateToTestViewController() {
        let viewModel = TestViewModel(questionNum: .first, totalAnswer: String())
        let testViewController = TestViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(testViewController, animated: true)
    }
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
        
        output.selectedButtonText
            .subscribe { [weak self] text in
                self?.chatView.showSelectedButton(text)
            }
            .disposed(by: disposeBag)
        
        output.endViewDelayEnd
            .subscribe { [weak self] _ in
                self?.chatView.showEndView()
            }
            .disposed(by: disposeBag)
        
        output.nextButtonDelayEnd
            .subscribe { [weak self] _ in
                self?.chatView.showNextButton()
            }
            .disposed(by: disposeBag)
    }
}
