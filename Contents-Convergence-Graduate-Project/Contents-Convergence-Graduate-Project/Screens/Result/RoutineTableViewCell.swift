//
//  RoutineTableViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/06.
//

import UIKit

final class RoutineTableViewCell: BaseTableViewCell {
    
    static let cellId = "cellId"
    
    // MARK: - property
    
    private let cellBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 8
        return view
    }()
    private let cellEmoji: UILabel = {
        let label = UILabel()
        label.text = "💦"
        label.font = .m16
        return label
    }()
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "물 떠놓기"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    
    // MARK: - init
    
    override func render() {
        [cellBackground, cellEmoji, cellLabel].forEach {
            contentView.addSubview($0)
        }
        
        cellBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cellEmoji.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        cellLabel.snp.makeConstraints {
            $0.leading.equalTo(cellEmoji.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 16))
    }
}
