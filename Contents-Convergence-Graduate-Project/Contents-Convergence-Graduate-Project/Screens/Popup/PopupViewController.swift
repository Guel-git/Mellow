//
//  PopupViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/22.
//

import UIKit

final class PopupViewController: BaseViewController {
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .sb30
        label.numberOfLines = 0
        label.setTextWithLineHeight(text: TextLiteral.PopupView.titleLabelText, lineHeight: 39)
        return label
    }()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAuthorization()
        setButtonAction()
    }
    
    override func render() {
        [titleLabel, mainButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.leading.equalToSuperview().inset(16)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.PopupView.navigationTitleText
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func getAuthorization() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            NotificationManager.shared.requestPermission()
        }
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToMainViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToMainViewController() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}
