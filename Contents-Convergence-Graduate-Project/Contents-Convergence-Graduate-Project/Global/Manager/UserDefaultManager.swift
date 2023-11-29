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
    
    @UserDefault(key: "sleepType", defaultValue: SleepType.Zombie)
    static var sleepType: SleepType
    
    @UserDefault(key: "sleepHour", defaultValue: 0)
    static var sleepHour: Int
    
    @UserDefault(key: "sleepTime", defaultValue: "")
    static var sleepTime: String
}
