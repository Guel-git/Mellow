//
//  SettingRepeatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class SettingRepeatViewController: BaseViewController {
    
//    private var selectedIndex = 0 {
//        didSet {
//            settingRepeatTableView.reloadData()
//            settingDayTableView.isHidden = selectedIndex == 0
//            if selectedIndex == 0 { selectedIndexArray = [] }
//        }
//    }
//    private var selectedIndexArray: [Int] = [] {
//        didSet { settingDayTableView.reloadData() }
//    }
//    var bindRepeatRoutine: ((String) -> ())?
    
    private let settingRepeatView = SettingRepeatView()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = settingRepeatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButtonAction()
    }

    // MARK: - func
    
//    private func setButtonAction() {
//        let confirmAction = UIAction { [weak self] _ in
//            self?.changeRepeatRoutine()
//        }
//        let cancelAction = UIAction { [weak self] _ in
//            self?.dismiss(animated: true)
//        }
//        mainButton.addAction(confirmAction, for: .touchUpInside)
//        cancelButton.addAction(cancelAction, for: .touchUpInside)
//    }
    
//    private func changeRepeatRoutine() {
//        let weekday = [0, 1, 2, 3, 4]
//        let weekend = [5, 6]
//        var indexToString = ""
//        if selectedIndexArray.isEmpty {
//            indexToString = TextLiteral.SettingView.initialRepeatText
//        } else if selectedIndexArray.count == 7 {
//            indexToString = TextLiteral.SettingView.everyDayText
//        } else if weekday == selectedIndexArray.sorted() {
//            indexToString = TextLiteral.SettingView.everyWeekdayText
//        } else if weekend == selectedIndexArray.sorted() {
//            indexToString = TextLiteral.SettingView.everyWeekendText
//        } else {
//            for i in 0..<7 {
//                if selectedIndexArray.contains(i) {
//                    indexToString += (TextLiteral.SettingView.repeatTableViewDictionary[i] ?? "") + TextLiteral.SettingView.commaText
//                }
//            }
//            indexToString.removeSubrange(indexToString.index(indexToString.endIndex, offsetBy: -2)..<indexToString.endIndex)
//        }
//        bindRepeatRoutine?(indexToString)
//        self.dismiss(animated: true)
//    }
}
