//
//  RepeatCollectionViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/30.
//

import UIKit

final class RepeatCollectionViewCell: BaseCollectionViewCell {
        
    var isTrue: Bool = true {
        didSet {
            cellBackground.backgroundColor = isTrue ? .dreamPurple300 : .dreamPurple100
        }
    }
    
    // MARK: - property
    
    private let cellBackground = UIView()
    let cellLabel: UILabel = {
        let label = UILabel()
        label.font = .r12
        label.textColor = .fontWhite
        return label
    }()
    
    // MARK: - func
    
    override func render() {
        [cellBackground, cellLabel].forEach {
            contentView.addSubview($0)
        }
        
        cellBackground.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        cellLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    override func configUI() {
        self.layer.cornerRadius = 12
        self.backgroundColor = .dreamPurple300
    }
}

