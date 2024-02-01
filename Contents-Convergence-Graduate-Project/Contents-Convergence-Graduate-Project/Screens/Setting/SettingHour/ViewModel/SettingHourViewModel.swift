//
//  SettingTimeViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import RxSwift

final class SettingHourViewModel: ViewModelType {
    
    struct Input {
        let tableViewItemTapped: Observable<Int>
        let mainButtonTapped: Observable<Void>
    }
    
    struct Output {
        let sleepHourString: Observable<String>
    }
    
    private var selectedIndex: Int = 0
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        
        _ = input.tableViewItemTapped
            .withUnretained(self)
            .map { _, index in
                self.saveSelectedIndex(index)
            }
        
        let sleepHourString = input.mainButtonTapped
            .withUnretained(self)
            .map { _ in self.changeSleepHour() }
        
        return Output(sleepHourString: sleepHourString)
    }
    
    // MARK: - private func
    
    private func saveSelectedIndex(_ index: Int) {
        self.selectedIndex = index
    }
    
    private func changeSleepHour() -> String {
        let hourString = TextLiteral.SettingView.timeTableViewDictionary[self.selectedIndex]
        return hourString ?? TextLiteral.hourText
//        bindSleepTime?(timeString)
//        self.dismiss(animated: true)
    }
}
