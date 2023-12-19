//
//  Date+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import Foundation

extension Date {
    var dateToTimeString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    var dateToKoreanString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "YYYY년 MM월 d일"
        return formatter.string(from: self)
    }
}

