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
    }
    
    struct Output {
        let dayTableViewIsHidden: Observable<Bool>
        let repeatTableViewItemIsSelected: Observable<[Bool]>
        let dayTableViewItemsSelected: Observable<[Bool]>
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
        
        return Output(dayTableViewIsHidden: dayTableViewIsHidden, repeatTableViewItemIsSelected: repeatTableViewItemIsSelected, dayTableViewItemsSelected: dayTableViewItemsSelected)
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
}
