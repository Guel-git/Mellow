//
//  SettingTimeViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class SettingTimeViewController: BaseViewController {
    
//    private var selectedIndex: Int = 0 {
//        didSet { settingTimeTableView.reloadData() }
//    }
//    var bindSleepTime: ((String) -> ())?
    private let settingTimeView = SettingTimeView()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = settingTimeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButtonAction()
    }

    // MARK: - func
    
//    private func setButtonAction() {
//        let confirmAction = UIAction { [weak self] _ in
//            self?.changeSleepTime()
//        }
//        let cancelAction = UIAction { [weak self] _ in
//            self?.dismiss(animated: true)
//        }
//        mainButton.addAction(confirmAction, for: .touchUpInside)
//        cancelButton.addAction(cancelAction, for: .touchUpInside)
//    }
//
//    private func changeSleepTime() {
//        guard let timeString = TextLiteral.SettingView.timeTableViewDictionary[selectedIndex] else { return }
//        bindSleepTime?(timeString)
//        self.dismiss(animated: true)
//    }
}
