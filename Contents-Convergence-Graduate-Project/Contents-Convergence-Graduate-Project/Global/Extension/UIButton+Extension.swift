//
//  UIButton+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/27.
//

import UIKit

extension UIButton {
    func popViewController() {
        let action = UIAction { [weak self] _ in
            self?.pop()
        }
        self.addAction(action, for: .touchUpInside)
    }
    
    private func pop() {
        UIApplication.topViewController()?.navigationController?.popViewController(animated: true)
    }
}
