//
//  SettingView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import RxSwift
import RxCocoa

final class SettingView: UIView {
    
    private var sleepArray = TextLiteral.SettingView.initialResultArray {
        didSet { settingTableView.reloadData() }
    }
    
    // MARK: - ui components
    
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
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.SettingView.mainButtonText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    var mainButtonTapPublisher: Observable<Void> {
        return mainButton.rx.tap.asObservable()
    }
    
    var pickerTimeChangePublisher: Observable<Date> {
        return sleepTimePicker.rx.date.asObservable()
    }
    
    var tableViewTapPublisher = PublishSubject<Int>()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupTableView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    func setupNavigationController(_ navigation: UINavigationController) {
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.tintColor = .fontBlack
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
    }
    
    func setupNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        
        navigationItem.title = TextLiteral.SettingView.navigationTitleText
    }
    
    func reflectSleepHour(_ sleepHour: String) {
        sleepArray[0] = sleepHour
    }
    
    // MARK: - private func
    
    private func setupLayout() {
        [sleepTimePicker, settingTableView, mainButton].forEach {
            self.addSubview($0)
        }
        
        sleepTimePicker.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
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
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    private func setupTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
        settingTableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.cellId)
        settingTableView.rowHeight = 51
        settingTableView.separatorStyle = .singleLine
        settingTableView.separatorColor = .systemMain
        settingTableView.isScrollEnabled = false
    }
    
}

// MARK: - extension

extension SettingView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 0 ? 0 : cell.bounds.size.width, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewTapPublisher.onNext(indexPath.item)
    }
}

extension SettingView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextLiteral.SettingView.tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.cellId, for: indexPath) as! SettingTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = TextLiteral.SettingView.tableViewArray[indexPath.item]
        cell.cellResult.text = sleepArray[indexPath.item]
        return cell
    }
}

