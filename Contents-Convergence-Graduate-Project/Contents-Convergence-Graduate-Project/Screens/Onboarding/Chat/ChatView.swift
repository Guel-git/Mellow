//
//  ChatView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/16.
//

import UIKit

import RxSwift
import RxCocoa

final class ChatView: UIView {
    
    // MARK: - ui components
    
    private let backButton = BackButton()
    private let startView: ChatStartView = {
        let view = ChatStartView()
//        view.isHidden = true
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
//        view.isHidden = true
        return view
    }()
    
    // MARK: - publisher
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    func setupNavigationController(_ navigation: UINavigationController) {
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.tintColor = .fontBlack
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
    }
    
    func setupNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        
        let backButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.questionViewControllerTitle
    }
    
    // MARK: - private func
    
}

// MARK: - setup layout

extension ChatView {
    private func setupLayout() {
        [startView, answerLabel, buttonStackView, endView, fourthButton].forEach {
            self.addSubview($0)
        }
        
        startView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(32)
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
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(169)
        }
        
        fourthButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(51)
        }
    }
}
