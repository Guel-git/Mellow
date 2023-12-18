//
//  StartButton.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/19.
//

import UIKit

import SnapKit

final class StartButton: UIButton {
    
    var title: String? {
        didSet { setupAttribute() }
    }
    
    var isGray: Bool = true {
        didSet { setupAttribute() }
    }
    
    private let chevronImage = UIImageView(image: ImageLiteral.startButtonChevronImage)
    
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
            $0.top.equalToSuperview().inset(22)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configUI() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 32
        self.titleLabel?.font = .m16
        self.setTitleColor(.fontBlack, for: .normal)
        self.chevronImage.tintColor = .fontBlack
    }
    
    private func setupAttribute() {
        if let title = title {
            self.setTitle(title, for: .normal)
        }
        
        self.backgroundColor = isGray ? .systemSub : .white
    }
}


