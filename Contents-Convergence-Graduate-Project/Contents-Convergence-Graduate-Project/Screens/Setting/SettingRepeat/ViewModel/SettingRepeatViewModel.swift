//
//  SettingRepeatViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import RxSwift

final class SettingRepeatViewModel: ViewModelType {
    
    struct Input {
        let repeatTableViewItemTapped: Observable<Int>
        let dayTableViewItemTapped: Observable<Int>
        let mainButtonTapped: Observable<Void>
    }
    
    struct Output {
        let dayTableViewIsHidden: Observable<Bool>
        let repeatTableViewItemIsSelected: Observable<[Bool]>
        let dayTableViewItemsSelected: Observable<[Bool]>
        let sleepRepeatString: Observable<String>
    }
    
    private var selectedDays = [Int]()
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        
        let dayTableViewIsHidden = input.repeatTableViewItemTapped
            .withUnretained(self)
            .map { _, item in
                self.isDayTableViewHidden(item)
            }
        
        let repeatTableViewItemIsSelected = input.repeatTableViewItemTapped
            .withUnretained(self)
            .map { _, item in
                self.selectedItemArray(item)
            }
        
        let dayTableViewItemsSelected = input.dayTableViewItemTapped
            .withUnretained(self)
            .map { _, item in
                self.selectedItemsArray(item)
            }
        
        let sleepRepeatString = input.mainButtonTapped
            .withUnretained(self)
            .map { _ in
                self.changeSleepRepeat()
            }
        
        return Output(dayTableViewIsHidden: dayTableViewIsHidden, repeatTableViewItemIsSelected: repeatTableViewItemIsSelected, dayTableViewItemsSelected: dayTableViewItemsSelected, sleepRepeatString: sleepRepeatString)
    }
    
    // MARK: - private func
    
    private func isDayTableViewHidden(_ item: Int) -> Bool {
        return item == 0
    }
    
    private func selectedItemArray(_ item: Int) -> [Bool] {
        if item == 0 { selectedDays = [Int]() }
        return [item == 0, item == 1]
    }
    
    private func selectedItemsArray(_ item: Int) -> [Bool] {
        if selectedDays.contains(item) {
            selectedDays = selectedDays.filter { $0 != item }
        } else {
            selectedDays.append(item)
        }
        
        var selectedItems = Array(repeating: false, count: 7)
        for i in selectedItems.indices {
            selectedItems[i] = selectedDays.contains(i)
        }
        return selectedItems
    }
    
    private func changeSleepRepeat() -> String {
        let weekday = [0, 1, 2, 3, 4]
        let weekend = [5, 6]
        var sleepRepeatString = String()
        if selectedDays.isEmpty {
            sleepRepeatString = TextLiteral.SettingView.initialRepeatText
        } else if selectedDays.count == 7 {
            sleepRepeatString = TextLiteral.SettingView.everyDayText
        } else if weekday == selectedDays.sorted() {
            sleepRepeatString = TextLiteral.SettingView.everyWeekdayText
        } else if weekend == selectedDays.sorted() {
            sleepRepeatString = TextLiteral.SettingView.everyWeekendText
        } else {
            for i in 0..<7 {
                if selectedDays.contains(i) {
                    sleepRepeatString += (TextLiteral.SettingView.repeatTableViewDictionary[i] ?? String()) + TextLiteral.SettingView.commaText
                }
            }
            sleepRepeatString.removeSubrange(sleepRepeatString.index(sleepRepeatString.endIndex, offsetBy: -2)..<sleepRepeatString.endIndex)
        }
        return sleepRepeatString
        }
}
