//
//  SplashViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/23.
//

import UIKit

final class SplashViewController: BaseViewController {
    
    // MARK: - property
    
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.startText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    override func render() {
        [mainButton].forEach {
            view.addSubview($0)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - func
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToChatViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToChatViewController() {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}
