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
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "최애"
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let favoriteImage = UIImageView(image: ImageLiteral.mainFavorite)
    private let favoriteTalkLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "어제 수면 시간에 핸드폰 했지?\n정말 실망이야.", lineHeight: 26)
        label.textColor = .fontBlack
        label.font = .r20
        label.numberOfLines = 2
        label.textAlignment = .center
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
        setButtonAction()
    }
    
    override func render() {
        [favoriteLabel, favoriteImage, favoriteTalkLabel, mainButton].forEach {
            view.addSubview($0)
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        favoriteImage.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(16)
            $0.width.height.equalTo(220)
            $0.centerX.equalToSuperview()
        }
        
        favoriteTalkLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
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
