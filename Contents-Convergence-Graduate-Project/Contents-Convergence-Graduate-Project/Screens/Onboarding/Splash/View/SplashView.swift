//
//  SplashView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/15.
//

import UIKit

import RxSwift
import RxCocoa

final class SplashView: UIView {
    
    // MARK: - ui components
    
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.startText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    var mainButtonTapPublisher: Observable<Void> {
        return mainButton.rx.tap.asObservable()
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

// MARK: - setup layout

extension SplashView {
    private func setupLayout() {
        [mainButton].forEach {
            self.addSubview($0)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
}
