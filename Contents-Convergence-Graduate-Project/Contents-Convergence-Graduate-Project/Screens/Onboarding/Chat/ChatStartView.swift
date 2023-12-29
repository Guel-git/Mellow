//
//  ChatStartView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

final class ChatStartView: BaseUIView {
    
    // MARK: - property
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.logoImage
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private let firstLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.text = TextLiteral.ChatView.startFirstLabelText
        return label
    }()
    private let secondLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.text = TextLiteral.ChatView.startSecondLabelText
        return label
    }()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func render() {
        [profileImageView, firstLabel, secondLabel].forEach {
            self.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.top.equalToSuperview()
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(4)
            $0.leading.equalTo(firstLabel.snp.leading)
        }
    }
}

