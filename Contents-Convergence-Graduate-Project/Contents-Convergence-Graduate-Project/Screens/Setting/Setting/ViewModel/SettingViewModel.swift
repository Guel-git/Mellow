//
//  SettingViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import RxSwift

final class SettingViewModel: ViewModelType {

    struct Input {
        let pickerTimeChanged: Observable<Date>
        let mainButtonTapped: Observable<Void>
        let sleepHourChanged: Observable<String>
    }
    
    struct Output {
        let endSetting: Observable<Void>
    }
    
    // MARK: - property
    
    private var resultArray = TextLiteral.SettingView.initialResultArray
    private var sleepTime: String?
    private var sleepHour: String?
    private var repeatDay = "없음"
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        
        _ = input.pickerTimeChanged
            .withUnretained(self)
            .subscribe { _, date in
                self.saveSleepTime(date)
            }
        
        let endSetting = input.mainButtonTapped
            .withUnretained(self)
            .map { _ in self.saveOnDevice() }
        
        _ = input.sleepHourChanged
            .withUnretained(self)
            .subscribe {_, sleepHour in
                self.saveSleepHour(sleepHour)
            }
        
        return Output(endSetting: endSetting)
    }
    
    // MARK: - private func
    
    private func saveSleepTime(_ date: Date) {
        sleepTime = date.dateToTimeString
    }
    
    private func saveSleepHour(_ sleepHour: String) {
        self.sleepHour = sleepHour
    }
    
    private func saveOnDevice() {
        UserDefaultManager.sleepTime = sleepTime ?? "23:00"
        UserDefaultManager.sleepHour = parseSleepHour()
    }
    
    private func parseSleepHour() -> Int {
        if let sleepHour = sleepHour {
            let hour = sleepHour.dropLast(2)
            return Int(String(hour))!
        } else {
            return 8
        }
    }
}
