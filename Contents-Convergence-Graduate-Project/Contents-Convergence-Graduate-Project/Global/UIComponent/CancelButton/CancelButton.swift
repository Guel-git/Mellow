//
//  CancelButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class CancelButton: UIButton {
    
    private let chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.navigationBarBackButton
        imageView.tintColor = .systemCancel
        return imageView
    }()
    private let cancelLabel: UILabel = {
        let label = UILabel()
        label.text = "취소"
        label.textColor = .systemCancel
        label.font = .m16
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func render() {
        [chevronImage, cancelLabel].forEach {
            self.addSubview($0)
        }
        
        chevronImage.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(16)
            $0.centerY.equalToSuperview()
        }
        
        cancelLabel.snp.makeConstraints {
            $0.leading.equalTo(chevronImage.snp.trailing).offset(4)
            $0.centerY.equalTo(chevronImage.snp.centerY)
        }
    }
}


