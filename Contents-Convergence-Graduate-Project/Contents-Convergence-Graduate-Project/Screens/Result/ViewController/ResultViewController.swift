//
//  ResultViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/02.
//

import UIKit

final class ResultViewController: BaseViewController {
    
    let resultType: SleepType
    private let resultView = ResultView()
    
    // MARK: - life cycle
    
    init(resultType: SleepType) {
        self.resultType = resultType
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButtonAction()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        resultView.setupNavigationController(navigationController)
        resultView.setupNavigationItem(navigationItem)
    }
    
//    override func configUI() {
//        titleLabel.text = resultType.typeText
//        emojiImage.image = resultType.typeImage
//        angelNameLabel.text = resultType.angelText + TextLiteral.ResultView.afterAngelText
//        angelNameLabel.applyFont(resultType.angelText, .sb20)
//        angelNameLabel.textAlignment = .center
//        favoriteLabel.setTextWithLineHeight(text: resultType.favoriteText, lineHeight: 27)
//        favoriteLabel.textAlignment = .center
//        contentLabel.setTextWithLineHeight(text: resultType.contentText, lineHeight: 24)
//        super.configUI()
//    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToSettingViewController()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
//
//    private func navigateToSettingViewController() {
//        let settingViewController = SettingViewController()
//        settingViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(settingViewController, animated: true)
//    }
}
