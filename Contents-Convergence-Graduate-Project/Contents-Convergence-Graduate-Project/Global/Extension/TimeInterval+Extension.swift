//
//  TimeInterval+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

extension TimeInterval {
    var time: String {
        return String(format:"%02d:%02d", Int(self/60), Int(ceil(truncatingRemainder(dividingBy: 60))) )
    }
}
