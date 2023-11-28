//
//  RoutineDetailTableViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import UIKit

final class RoutineDetailTableViewCell: BaseTableViewCell {
    
    static let cellId = "cellId"
    
    // MARK: - property
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 8
        return view
    }()
    let cellImage = UIImageView(image: ImageLiteral.clothesImage)
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "내일 입을 옷 꺼내두기"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    let cellSubLabel: UILabel = {
        let label = UILabel()
        label.text = "권장 시간 : 3분 30초"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    
    // MARK: - init
    
    override func render() {
        contentView.addSubview(backView)
        [cellImage, cellLabel, cellSubLabel].forEach {
            backView.addSubview($0)
        }
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cellImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(16)
        }
        
        cellLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(cellImage.snp.trailing).offset(8)
        }
        
        cellSubLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(cellImage.snp.trailing).offset(8)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 16))
    }
}
