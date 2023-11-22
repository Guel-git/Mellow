//
//  SettingRepeatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class SettingRepeatViewController: BaseViewController {
    
    private var selectedIndex = 0 {
        didSet { settingRepeatTableView.reloadData() }
    }
    private var selectedIndexArray: [Int] = [] {
        didSet { settingDayTableView.reloadData() }
    }
    var bindRepeatRoutine: ((String) -> ())?
    
    // MARK: - property
    
    private let cancelButton = CancelButton()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.SettingView.repeatNavigationTitleText
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let settingRepeatTableView = UITableView()
    private let settingDayTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.confirmText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSettingTimeTableView()
        setSettingDayTableView()
        setButtonAction()
    }
    
    override func render() {
        [cancelButton, titleLabel, settingRepeatTableView, settingDayTableView, mainButton].forEach {
            view.addSubview($0)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(45)
            $0.height.equalTo(18)
        }

        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(cancelButton.snp.centerY)
            $0.centerX.equalToSuperview()
        }
        
        settingRepeatTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(102)
        }
        
        settingDayTableView.snp.makeConstraints {
            $0.top.equalTo(settingRepeatTableView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(357)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
    }

    // MARK: - func
    
    private func setSettingTimeTableView() {
        settingRepeatTableView.delegate = self
        settingRepeatTableView.dataSource = self
        
        settingRepeatTableView.register(SettingDetailTableViewCell.self, forCellReuseIdentifier: SettingDetailTableViewCell.cellId)
        settingRepeatTableView.rowHeight = 51
        settingRepeatTableView.separatorStyle = .singleLine
        settingRepeatTableView.separatorColor = .systemMain
        settingRepeatTableView.isScrollEnabled = false
        settingRepeatTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setSettingDayTableView() {
        settingDayTableView.delegate = self
        settingDayTableView.dataSource = self
        
        settingDayTableView.register(SettingDayTableViewCell.self, forCellReuseIdentifier: SettingDayTableViewCell.cellId)
        settingDayTableView.rowHeight = 51
        settingDayTableView.separatorStyle = .singleLine
        settingDayTableView.separatorColor = .systemMain
        settingDayTableView.isScrollEnabled = false
    }
    
    private func setButtonAction() {
        let confirmAction = UIAction { [weak self] _ in
            self?.changeRepeatRoutine()
        }
        let cancelAction = UIAction { [weak self] _ in
            self?.dismiss(animated: true)
        }
        mainButton.addAction(confirmAction, for: .touchUpInside)
        cancelButton.addAction(cancelAction, for: .touchUpInside)
    }
    
    private func changeRepeatRoutine() {
        // FIXME: - 로직 수정 필요
        var indexToString = ""
        for i in 0..<7 {
            if selectedIndexArray.contains(i) {
                indexToString += (TextLiteral.SettingView.repeatTableViewDictionary[i] ?? "") + ", "
            }
        }
        if indexToString.isEmpty {
            indexToString = TextLiteral.SettingView.initialRepeatText
        } else {
            indexToString.removeSubrange(indexToString.index(indexToString.endIndex, offsetBy: -2)..<indexToString.endIndex)
        }
        bindRepeatRoutine?(indexToString)
        self.dismiss(animated: true)
    }
}

// MARK: - extension

extension SettingRepeatViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == settingDayTableView {
            cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 6 ? cell.bounds.size.width : 0, bottom: 0, right: 0)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == settingRepeatTableView {
            selectedIndex = indexPath.item
        } else {
            if selectedIndexArray.contains(indexPath.item) {
                selectedIndexArray = selectedIndexArray.filter { $0 != indexPath.item }
            } else {
                selectedIndexArray.append(indexPath.item)
            }
            print(selectedIndexArray)
        }
    }
}

extension SettingRepeatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == settingRepeatTableView ? TextLiteral.SettingView.repeatTableViewArray.count : TextLiteral.SettingView.repeatTableViewDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == settingRepeatTableView {
            let cell = settingRepeatTableView.dequeueReusableCell(withIdentifier: SettingDetailTableViewCell.cellId, for: indexPath) as! SettingDetailTableViewCell
            cell.selectionStyle = .none
            cell.cellLabel.text = TextLiteral.SettingView.repeatTableViewArray[indexPath.item]
            cell.isSelected = indexPath.item == selectedIndex
            return cell
        } else {
            let cell = settingDayTableView.dequeueReusableCell(withIdentifier: SettingDayTableViewCell.cellId, for: indexPath) as! SettingDayTableViewCell
            cell.selectionStyle = .none
            cell.cellLabel.text = TextLiteral.SettingView.repeatTableViewDictionary[indexPath.item]
            cell.isSelected = selectedIndexArray.contains(indexPath.item)
            return cell
        }
    }
}
