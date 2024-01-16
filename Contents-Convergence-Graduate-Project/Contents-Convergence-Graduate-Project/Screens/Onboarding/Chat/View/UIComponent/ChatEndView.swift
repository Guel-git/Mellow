//
//  ChatEndView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

import SnapKit

final class ChatEndView: BaseUIView {
    
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
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstLabel, secondLabel, thirdLabel, fourthLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func render() {
        [profileImageView, labelStackView].forEach {
            self.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.leading.top.equalToSuperview()
        }
        
        labelStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(5)
            $0.top.equalTo(profileImageView.snp.top)
        }
    }
}

