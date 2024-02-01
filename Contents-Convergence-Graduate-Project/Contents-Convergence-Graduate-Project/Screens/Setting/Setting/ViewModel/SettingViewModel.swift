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
    }
    
    struct Output {
        let endSetting: Observable<Void>
        let sleepHour: Observable<String>
        let repeatDay: Observable<String>
    }
    
    // MARK: - property
    
    private var resultArray = TextLiteral.SettingView.initialResultArray
    private var sleepTime = "23:00"
    private var sleepHour = "8시간"
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
                
//        let sleepHour = self.sleepHour viewWillAppear
        
//        let repeatDay = self.repeatDay
        
        return Output(endSetting: endSetting)
    }
    
    // MARK: - private func
    
    private func saveSleepTime(_ date: Date) {
        sleepTime = date.dateToTimeString
    }
    
    private func saveOnDevice() {
        UserDefaultManager.sleepHour = parseSleepHour()
        UserDefaultManager.sleepTime = sleepTime
    }
    
    private func parseSleepHour() -> Int {
        let hour = sleepHour.dropLast(2)
        return Int(String(hour))!
    }
}
