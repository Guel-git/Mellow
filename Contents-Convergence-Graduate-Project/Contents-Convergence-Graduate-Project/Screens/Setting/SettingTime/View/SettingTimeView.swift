//
//  SettingTimeView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import RxSwift
import RxCocoa

final class SettingTimeView: UIView {
    
    // MARK: - ui components
    
    private let cancelButton = CancelButton()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.SettingView.timeNavigationTitleText
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let settingTimeTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    var cancelButtonTapPublisher: Observable<Void> {
        return cancelButton.rx.tap.asObservable()
    }
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupTableView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    // MARK: - private func
    
    private func setupLayout() {
        [cancelButton, titleLabel, settingTimeTableView, mainButton].forEach {
            self.addSubview($0)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(45)
            $0.height.equalTo(18)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(cancelButton.snp.centerY)
            $0.centerX.equalToSuperview()
        }
        
        settingTimeTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(204)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    private func setupTableView() {
        settingTimeTableView.delegate = self
        settingTimeTableView.dataSource = self
        
        settingTimeTableView.register(SettingDetailTableViewCell.self, forCellReuseIdentifier: SettingDetailTableViewCell.cellId)
        settingTimeTableView.rowHeight = 51
        settingTimeTableView.separatorStyle = .singleLine
        settingTimeTableView.separatorColor = .systemMain
        settingTimeTableView.isScrollEnabled = false
    }
    
}

// MARK: - extension

extension SettingTimeView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 3 ? cell.bounds.size.width : 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedIndex = indexPath.item
        print(indexPath.item)
    }
}

extension SettingTimeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextLiteral.SettingView.timeTableViewDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTimeTableView.dequeueReusableCell(withIdentifier: SettingDetailTableViewCell.cellId, for: indexPath) as! SettingDetailTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = TextLiteral.SettingView.timeTableViewDictionary[indexPath.item]
//        cell.isSelected = indexPath.item == selectedIndex ? true : false
        return cell
    }
}
