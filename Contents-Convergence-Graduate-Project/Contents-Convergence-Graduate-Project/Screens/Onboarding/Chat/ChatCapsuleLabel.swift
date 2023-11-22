//
//  ChatCapsuleLabel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/15.
//

import UIKit

class ChatCapsuleLabel: UILabel {
    var overallInset: CGFloat = 12.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: overallInset, left: overallInset, bottom: overallInset, right: overallInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + 2 * overallInset , height: size.height + 2 * overallInset)
    }
    
    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - 2 * overallInset
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func configUI() {
        self.backgroundColor = .systemSub
        self.textColor = .fontBlack
        self.font = .m16
        self.clipsToBounds = true
        self.layer.cornerRadius = 6
        self.numberOfLines = 0
    }
}
