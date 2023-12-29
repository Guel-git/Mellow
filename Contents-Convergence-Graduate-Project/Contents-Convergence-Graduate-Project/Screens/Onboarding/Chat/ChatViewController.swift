//
//  ChatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

final class ChatViewController: BaseViewController {
    
    // MARK: - property
    
    private let backButton = BackButton()
    private let startView: ChatStartView = {
        let view = ChatStartView()
        view.isHidden = true
        return view
    }()
    private let answerLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.backgroundColor = .dreamPurple100
        label.isHidden = true
        return label
    }()
    private let firstButton = ChatButton(buttonText: TextLiteral.ChatView.firstChatButtonText)
    private let secondButton = ChatButton(buttonText: TextLiteral.ChatView.secondChatButtonText)
    private let thirdButton = ChatButton(buttonText: TextLiteral.ChatView.thirdChatButtonText)
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.isHidden = true
        return stackView
    }()
    private let fourthButton: ChatButton = {
        let button = ChatButton(buttonText: TextLiteral.ChatView.fourthChatButtonText)
        button.isHidden = true
        return button
    }()
    private let endView: ChatEndView = {
        let view = ChatEndView()
        view.isHidden = true
        return view
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelay()
        setButtonAction()
    }
    
    override func render() {
        [startView, answerLabel, buttonStackView, endView, fourthButton].forEach {
            view.addSubview($0)
        }
        
        startView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.leading.equalToSuperview().inset(26)
            $0.width.equalTo(244)
            $0.height.equalTo(90)
        }
        
        answerLabel.snp.makeConstraints {
            $0.top.equalTo(startView.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        endView.snp.makeConstraints {
            $0.top.equalTo(answerLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(26)
            $0.width.equalTo(275)
            $0.height.equalTo(242)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(169)
        }
        
        fourthButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(51)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.questionViewControllerTitle
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let firstAction = UIAction { [weak self] _ in
            self?.didTappedNextButton(self?.firstButton.buttonText)
        }
        let secondAction = UIAction { [weak self] _ in
            self?.didTappedNextButton(self?.secondButton.buttonText)
        }
        let thirdAction = UIAction { [weak self] _ in
            self?.didTappedNextButton(self?.thirdButton.buttonText)
        }
        let fourthAction = UIAction { [weak self] _ in
            self?.navigateToTestViewController()
        }
        firstButton.addAction(firstAction, for: .touchUpInside)
        secondButton.addAction(secondAction, for: .touchUpInside)
        thirdButton.addAction(thirdAction, for: .touchUpInside)
        fourthButton.addAction(fourthAction, for: .touchUpInside)
    }
    
    private func didTappedNextButton(_ text: String?) {
        answerLabel.text = text
        answerLabel.isHidden = false
        buttonStackView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.endView.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.fourthButton.isHidden = false
        }
    }
    
    private func setDelay() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.startView.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) {
            self.buttonStackView.isHidden = false
        }
    }
    
    private func navigateToTestViewController() {
        let testViewController = TestViewController(questionNum: .first, totalAnswer: "")
        testViewController.navigationItem.hidesBackButton = true
        self.navigationController?.pushViewController(testViewController, animated: true)
    }
}
