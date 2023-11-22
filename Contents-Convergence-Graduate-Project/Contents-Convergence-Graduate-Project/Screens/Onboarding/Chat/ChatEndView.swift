//
//  ChatEndView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

final class ChatEndView: BaseUIView {
    
    // MARK: - property
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemMain
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    private let firstLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.text = TextLiteral.ChatView.endFirstLabelText
        return label
    }()
    private let secondLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.setTextWithLineHeight(text: TextLiteral.ChatView.endSecondLabelText, lineHeight: 27)
        return label
    }()
    private let thirdLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.text = TextLiteral.ChatView.endThirdLabelText
        return label
    }()
    private let fourthLabel: ChatCapsuleLabel = {
        let label = ChatCapsuleLabel()
        label.setTextWithLineHeight(text: TextLiteral.ChatView.endFourthLabelText, lineHeight: 27)
        return label
    }()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func render() {
        [profileImageView, firstLabel, secondLabel, thirdLabel, fourthLabel].forEach {
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
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom).offset(4)
            $0.leading.equalTo(firstLabel.snp.leading)
        }
        
        fourthLabel.snp.makeConstraints {
            $0.top.equalTo(thirdLabel.snp.bottom).offset(4)
            $0.leading.equalTo(firstLabel.snp.leading)
        }
    }
}

