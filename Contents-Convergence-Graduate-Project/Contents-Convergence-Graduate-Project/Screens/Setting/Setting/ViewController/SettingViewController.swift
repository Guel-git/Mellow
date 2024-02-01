//
//  SettingViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/20.
//

import UIKit

final class SettingViewController: BaseViewController {
    
//    private var resultArray = TextLiteral.SettingView.initialResultArray
    private let settingView = SettingView()
    
    // MARK: - property
    
    private let settingTimeViewController = SettingTimeViewController()
    private let settingRepeatViewController = SettingRepeatViewController()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = settingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        settingView.setupNavigationController(navigationController)
        settingView.setupNavigationItem(navigationItem)
    }
    
//    private func bindSleepTime() {
//        settingTimeViewController.bindSleepTime = { [weak self] timeString in
//            self?.resultArray[0] = timeString
//            self?.settingTableView.reloadData()
//        }
//    }
//
//    private func bindRepeatRoutine() {
//        settingRepeatViewController.bindRepeatRoutine = { [weak self] repeatString in
//            self?.resultArray[1] = repeatString
//            self?.settingTableView.reloadData()
//        }
//    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToPopupViewController()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
//
//    private func navigateToPopupViewController() {
//        UserDefaultManager.sleepHour = parseSleepHour()
//        UserDefaultManager.sleepTime = sleepTimePicker.date.dateToTimeString
//        let popupViewController = PopupViewController()
//        navigationController?.pushViewController(popupViewController, animated: true)
//    }
//
//    private func parseSleepHour() -> Int {
//        let hour = resultArray[0].dropLast(2)
//        return Int(String(hour))!
//    }
}

