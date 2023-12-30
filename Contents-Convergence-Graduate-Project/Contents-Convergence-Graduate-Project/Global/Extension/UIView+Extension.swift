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
    
    func setGradient(start: UIColor, end: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "gradientLayer"
        gradient.colors = [start.cgColor, end.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
    
    func setBackgroundGradient(start: UIColor, end: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.name = "gradientLayer"
        gradient.colors = [start.cgColor, end.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
