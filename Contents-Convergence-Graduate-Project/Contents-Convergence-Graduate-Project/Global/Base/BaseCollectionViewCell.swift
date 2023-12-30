//
//  BaseCollectionViewCell.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/30.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - func
    
    func setHierarchy() {
        
    }
    
    func render() {
        // Override Layout
    }
    
    func configUI() {
        // View Configuration
    }
}

