//
//  MainButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/27.
//

import UIKit

import SnapKit

final class MainButton: UIButton {
    
    var title: String? {
        didSet { setupAttribute() }
    }
    
    var isDisabled: Bool = true {
        didSet { setupAttribute() }
    }
    
    private let chevronImage = UIImageView(image: ImageLiteral.mainButtonChevronImage)
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func render() {
        self.addSubview(chevronImage)
        chevronImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(10)
            $0.height.equalTo(18)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func configUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.titleLabel?.font = .m16
        self.setTitleColor(.fontWhite, for: .normal)
    }
    
    private func setupAttribute() {
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        self.isEnabled = !isDisabled
        self.chevronImage.tintColor = .fontWhite
        self.backgroundColor = isDisabled ? .dreamPurple500.withAlphaComponent(0.24) : .dreamPurple500
    }
}

