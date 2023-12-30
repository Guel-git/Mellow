//
//  NSObject.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/30.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
