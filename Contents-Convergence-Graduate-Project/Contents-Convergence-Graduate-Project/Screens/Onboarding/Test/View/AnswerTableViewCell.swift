//
//  AnswerTableViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/26.
//

import UIKit

final class AnswerTableViewCell: BaseTableViewCell {
    
    static let cellId = "cellId"
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        cellBackground.backgroundColor = selected ? .dreamPurple100 : .dreamPurple50
        cellImage.tintColor = selected ? .dreamPurple300 : .dreamPurple100
    }
    
    // MARK: - property
    
    private let cellBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.answerCheckImage
        return imageView
    }()
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = .m16
        label.textColor = .fontBlack
        return label
    }()
    
    // MARK: - func
    
    override func render() {
        [cellBackground, cellImage, cellLabel].forEach {
            contentView.addSubview($0)
        }
        
        cellBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cellImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(16)
        }
        
        cellLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(cellImage.snp.trailing).offset(8)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 8, right: 16))
    }
}
