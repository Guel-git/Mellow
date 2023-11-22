//
//  SettingViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/20.
//

import UIKit

final class SettingViewController: BaseViewController {
    
    private var resultArray = ["8시간", "없음"]
    
    // MARK: - property
    
    private let sleepTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .time
        picker.locale = Locale(identifier: "ko-KR")
        picker.timeZone = .autoupdatingCurrent
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        picker.date = dateFormatter.date(from: "11:00 PM") ?? Date()
        picker.layer.shadowOpacity = 0.1
        picker.layer.shadowRadius = 6
        picker.layer.shadowOffset = CGSize(width: 0, height: 2)
        return picker
    }()
    private let settingTableView = UITableView()
    private let settingTimeViewController = SettingTimeViewController()
    private let settingRepeatViewController = SettingRepeatViewController()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = "규칙적인 수면 시작하기"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSettingTableView()
        bindSleepTime()
        bindRepeatRoutine()
        setButtonAction()
    }
    
    override func render() {
        [sleepTimePicker, settingTableView, mainButton].forEach {
            view.addSubview($0)
        }
        
        sleepTimePicker.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        settingTableView.snp.makeConstraints {
            $0.top.equalTo(sleepTimePicker.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(102)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "시간 설정하기"
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setSettingTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.cellId)
        settingTableView.rowHeight = 51
        settingTableView.separatorStyle = .singleLine
        settingTableView.separatorColor = .systemMain
        settingTableView.isScrollEnabled = false
    }
    
    private func bindSleepTime() {
        settingTimeViewController.bindSleepTime = { [weak self] timeString in
            self?.resultArray[0] = timeString
            self?.settingTableView.reloadData()
        }
    }
    
    private func bindRepeatRoutine() {
        settingRepeatViewController.bindRepeatRoutine = { [weak self] repeatString in
            self?.resultArray[1] = repeatString
            self?.settingTableView.reloadData()
        }
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToPopup()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToPopup() {
        // FIXME: - popup view controller 로 navigate
    }
}

// MARK: - extension

extension SettingViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 0 ? 0 : cell.bounds.size.width, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            settingTimeViewController.modalPresentationStyle = .pageSheet
            self.present(settingTimeViewController, animated: true)
        } else {
            settingRepeatViewController.modalPresentationStyle = .pageSheet
            self.present(settingRepeatViewController, animated: true)
        }
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextLiteral.SettingView.tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.cellId, for: indexPath) as! SettingTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = TextLiteral.SettingView.tableViewArray[indexPath.item]
        cell.cellResult.text = resultArray[indexPath.item]
        return cell
    }
}

