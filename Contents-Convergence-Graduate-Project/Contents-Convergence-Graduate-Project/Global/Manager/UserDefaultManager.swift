//
//  UserDefaultManager.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/23.
//

import Foundation

struct UserDefaultManager {
    @UserDefault(key: "numOfBackgroundEntered", defaultValue: 0)
    static var numOfBackgroundEntered: Int
}