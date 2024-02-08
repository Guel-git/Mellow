//
//  PopupView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/08.
//

import UIKit

import RxSwift
import RxCocoa

final class PopupView: UIView {
    
    // MARK: - ui components
    
    private let backButton = BackButton(type: .system)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .sb30
        label.numberOfLines = 0
        label.setTextWithLineHeight(text: TextLiteral.PopupView.titleLabelText, lineHeight: 39)
        return label
    }()
    private let popupImage = UIImageView(image: ImageLiteral.popupImage)
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    func setupNavigationController(_ navigation: UINavigationController) {
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.tintColor = .fontBlack
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
    }
    
    func setupNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        
        let backButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.PopupView.navigationTitleText
    }
    
    // MARK: - private func
    
    private func setupLayout() {
        [titleLabel, popupImage, mainButton].forEach {
            self.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.leading.equalToSuperview().inset(16)
        }
        
        popupImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(118)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(270)
            $0.height.equalTo(184)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
}
