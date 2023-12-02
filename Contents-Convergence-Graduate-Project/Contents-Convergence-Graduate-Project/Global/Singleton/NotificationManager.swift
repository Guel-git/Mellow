//
//  NotificationManager.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/22.
//

import UIKit

import UserNotifications

final class NotificationManager {
    static let shared = NotificationManager()
    
    func requestPermission() {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert , .badge , .sound]) { granted, error in
                if granted == true && error == nil {
                    print("granted")
                } else {
                    print("not granted")
                }
            }
    }
}
