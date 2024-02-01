//
//  SettingTableViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/20.
//

import UIKit

import SnapKit

final class SettingTableViewCell: BaseTableViewCell {
    
    static let cellId = "cellId"
    
    // MARK: - property
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    let cellResult: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let cellChevron: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.mainButtonChevronImage
        imageView.tintColor = .fontBlack
        return imageView
    }()
    
    // MARK: - init
    
    override func render() {
        [cellLabel, cellResult, cellChevron].forEach {
            self.addSubview($0)
        }
        
        cellLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
        
        cellChevron.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(10)
            $0.height.equalTo(16)
        }
        
        cellResult.snp.makeConstraints {
            $0.trailing.equalTo(cellChevron.snp.leading).offset(-6)
            $0.centerY.equalToSuperview()
        }
    }
}
