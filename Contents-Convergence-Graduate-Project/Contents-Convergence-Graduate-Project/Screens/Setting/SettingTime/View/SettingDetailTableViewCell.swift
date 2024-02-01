//
//  SettingDetailTableViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class SettingDetailTableViewCell: BaseTableViewCell {
    
    static let cellId = "cellId"
    override var isSelected: Bool {
        didSet {
            cellCheckImage.tintColor = isSelected ? .fontBlack : .systemMain
        }
    }
    
    // MARK: - property
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let cellCheckImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.answerCheckImage
        imageView.tintColor = .systemMain
        return imageView
    }()
    
    // MARK: - init
    
    override func render() {
        [cellLabel, cellCheckImage].forEach {
            self.addSubview($0)
        }
        
        cellLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
        cellCheckImage.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(18)
        }
    }
}
