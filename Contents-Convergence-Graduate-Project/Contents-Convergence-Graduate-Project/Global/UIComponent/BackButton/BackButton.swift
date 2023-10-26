//
//  BackButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/27.
//

import UIKit

final class BackButton: UIButton {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
        setBackButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    private func configUI() {
        self.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        self.setImage(ImageLiteral.navigationBarBackButton, for: .normal)
        self.tintColor = .fontBlack
    }
    
    private func setBackButtonAction() {
        self.popViewController()
    }
}
