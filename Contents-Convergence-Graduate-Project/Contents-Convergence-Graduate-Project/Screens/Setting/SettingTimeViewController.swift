//
//  SettingTimeViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

final class SettingTimeViewController: BaseViewController {
    
    private var selectedIndex: Int = 0 {
        didSet { settingTimeTableView.reloadData() }
    }
    var didTappedTime: ((String) -> ())?
    
    // MARK: - property
    
    private let cancelButton = CancelButton()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 시간"
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let settingTimeTableView = UITableView()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSettingTimeTableView()
    }
    
    override func render() {
        [cancelButton, titleLabel, settingTimeTableView].forEach {
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
        
        settingTimeTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(204)
        }
    }

    // MARK: - func
    
    private func setSettingTimeTableView() {
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

extension SettingTimeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: indexPath.row == 3 ? cell.bounds.size.width : 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        var timeString = ""
        switch selectedIndex {
        case 0:
            timeString = "8시간"
        case 1:
            timeString = "9시간"
        case 2:
            timeString = "10시간"
        case 3:
            timeString = "11시간"
        default:
            timeString = "8시간"
        }
        didTappedTime?(timeString)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.dismiss(animated: true)
        }
    }
}

extension SettingTimeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextLiteral.SettingView.timeTableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTimeTableView.dequeueReusableCell(withIdentifier: SettingDetailTableViewCell.cellId, for: indexPath) as! SettingDetailTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = TextLiteral.SettingView.timeTableViewArray[indexPath.item]
        cell.isSelected = indexPath.item == selectedIndex ? true : false
        return cell
    }
}


