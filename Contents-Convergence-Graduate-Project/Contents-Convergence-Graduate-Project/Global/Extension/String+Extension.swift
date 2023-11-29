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
    
    func secondToMinute() -> String {
        let stringToInt = Int(self)!
        let minute = stringToInt / 60
        let second = stringToInt % 60
        if minute == 0 {
            return String(second) + TextLiteral.secondText
        } else if second == 0 {
            return String(minute) + TextLiteral.minuteText
        } else {
            return String(minute) + TextLiteral.minuteText + " " + String(second) + TextLiteral.secondText
        }
    }
    
    func secondToMinuteWithSpacing() -> String {
        let stringToInt = Int(self)!
        let minute = stringToInt / 60
        let second = stringToInt % 60
        if minute == 0 {
            return String(second) + TextLiteral.secondText
        } else if second == 0 {
            return String(minute) + TextLiteral.minuteText
        } else {
            return String(minute) + TextLiteral.minuteText + "\n" + String(second) + TextLiteral.secondText
        }
    }
    
    func calculateSleepTime() -> String {
        let sleepTime = self
        let sleepHour = UserDefaultManager.sleepHour
        let wakeUpHour = Int(sleepTime.split(separator: ":")[0])! + sleepHour
        let wakeUpMinute = sleepTime.split(separator: ":")[1]
        var result = String()
        if wakeUpHour > 24 {
            result = TextLiteral.moringText + String(wakeUpHour-24) + TextLiteral.hourText
        } else if wakeUpHour > 12 {
            result = TextLiteral.afternoonText + String(wakeUpHour-12) + TextLiteral.hourText
        } else {
            result = TextLiteral.moringText + String(wakeUpHour) + TextLiteral.hourText
        }
        if wakeUpMinute != "00" {
            if wakeUpMinute.starts(with: "0") {
                result += " " + wakeUpMinute.dropFirst() + TextLiteral.moringText
            } else {
                result += " " + wakeUpMinute + TextLiteral.minuteText
            }
        }
        return result
    }
}
