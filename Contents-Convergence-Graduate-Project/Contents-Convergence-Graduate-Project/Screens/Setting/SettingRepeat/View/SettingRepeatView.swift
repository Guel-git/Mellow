//
//  SettingRepeatView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/01.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class SettingRepeatView: UIView {
    
    private var selectedIndex = 0
    private var repeatTableViewItemSelected = [true, false]
    
    // MARK: - ui components
    
    private let cancelButton = CancelButton()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.SettingView.repeatNavigationTitleText
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let repeatTableView = UITableView()
    private let dayTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    var cancelButtonPublisher: Observable<Void> {
        return cancelButton.rx.tap.asObservable()
    }
    
    var repeatTableViewTabPublisher = PublishSubject<Int>()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupRepeatTableView()
        setupDayTableView()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    func setupDayTableViewVisibility(_ isHidden: Bool) {
        dayTableView.isHidden = isHidden
    }
    
    func setupRepeatTableViewItemSelected(_ selectedItemArray: [Bool]) {
        repeatTableViewItemSelected = selectedItemArray
        repeatTableView.reloadData()
    }
    
    // MARK: - private func
    
    private func setupLayout() {
        [cancelButton, titleLabel, repeatTableView, dayTableView, mainButton].forEach {
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
        
        repeatTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(102)
        }
        
        dayTableView.snp.makeConstraints {
            $0.top.equalTo(repeatTableView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(357)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }
    
    private func setupRepeatTableView() {
        repeatTableView.delegate = self
        repeatTableView.dataSource = self
        
        repeatTableView.register(SettingDetailTableViewCell.self, forCellReuseIdentifier: SettingDetailTableViewCell.cellId)
        repeatTableView.rowHeight = 51
        repeatTableView.separatorStyle = .singleLine
        repeatTableView.separatorColor = .systemMain
        repeatTableView.isScrollEnabled = false
        repeatTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupDayTableView() {
        dayTableView.delegate = self
        dayTableView.dataSource = self
        
        dayTableView.register(SettingDayTableViewCell.self, forCellReuseIdentifier: SettingDayTableViewCell.cellId)
        dayTableView.rowHeight = 51
        dayTableView.separatorStyle = .singleLine
        dayTableView.separatorColor = .systemMain
        dayTableView.isScrollEnabled = false
        dayTableView.isHidden = true
    }
}

// MARK: - extension

extension SettingRepeatView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == dayTableView {
            cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 6 ? cell.bounds.size.width : 0, bottom: 0, right: 0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView == repeatTableView {
//            selectedIndex = indexPath.item
//        } else {
//            if selectedIndexArray.contains(indexPath.item) {
//                selectedIndexArray = selectedIndexArray.filter { $0 != indexPath.item }
//            } else {
//                selectedIndexArray.append(indexPath.item)
//            }
//        }
        if tableView == repeatTableView {
            repeatTableViewTabPublisher.onNext(indexPath.item)
        }
    }
}

extension SettingRepeatView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == repeatTableView ? TextLiteral.SettingView.repeatTableViewArray.count : TextLiteral.SettingView.repeatTableViewDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == repeatTableView {
            let cell = repeatTableView.dequeueReusableCell(withIdentifier: SettingDetailTableViewCell.cellId, for: indexPath) as! SettingDetailTableViewCell
            cell.selectionStyle = .none
            cell.cellLabel.text = TextLiteral.SettingView.repeatTableViewArray[indexPath.item]
            cell.isSelected = repeatTableViewItemSelected[indexPath.item]
            return cell
        } else {
            let cell = dayTableView.dequeueReusableCell(withIdentifier: SettingDayTableViewCell.cellId, for: indexPath) as! SettingDayTableViewCell
            cell.selectionStyle = .none
            cell.cellLabel.text = (TextLiteral.SettingView.repeatTableViewDictionary[indexPath.item] ?? "") + TextLiteral.SettingView.repeatDayText
//            cell.isSelected = selectedIndexArray.contains(indexPath.item)
            return cell
        }
    }
}
