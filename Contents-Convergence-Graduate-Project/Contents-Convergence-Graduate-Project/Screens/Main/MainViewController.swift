//
//  MainViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/28.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - property
    
    private let menuButton = MenuButton(type: .system)
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
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
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let menuButton = makeBarButtonItem(with: menuButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = menuButton
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToRoutineStartViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToRoutineStartViewController() {
        let routineStartViewController = RoutineStartViewController()
        navigationController?.pushViewController(routineStartViewController, animated: true)
    }
}
