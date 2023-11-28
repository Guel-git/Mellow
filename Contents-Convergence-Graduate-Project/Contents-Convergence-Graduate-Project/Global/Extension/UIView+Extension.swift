//
//  UIView+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import UIKit

extension UIView {
    func addDashedLine() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.systemMain.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [5,5]
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: 0, y: bounds.height)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
