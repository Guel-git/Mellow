//
//  MenuButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/28.
//

import UIKit

final class MenuButton: UIButton {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }
    
    private func configUI() {
        self.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        self.setImage(ImageLiteral.navigationBarMenuButton, for: .normal)
        self.tintColor = .dreamPurple500
    }
}
