//
//  ChatButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

class ChatButton: UIButton {
    
    var buttonText: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(buttonText: String) {
        self.init()
        self.buttonText = buttonText
        configUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - func
    
    private func configUI() {
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        var titleAttribute = AttributedString.init(buttonText)
        titleAttribute.font = .sb16
        titleAttribute.foregroundColor = .fontBlack
        configuration.attributedTitle = titleAttribute
        self.configuration = configuration
        self.backgroundColor = .fontWhite
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.dreamPurple50.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
