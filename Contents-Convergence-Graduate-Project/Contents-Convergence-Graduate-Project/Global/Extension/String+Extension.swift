//
//  String+Extension.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/31.
//

import Foundation

extension String {
    func stringToDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone(abbreviation: "KST")
        return formatter.date(from: self) ?? Date()
    }
}
