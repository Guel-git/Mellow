//
//  ResultViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/02.
//

import UIKit

final class ResultViewController: BaseViewController {
    
    let resultType: SleepType
    private let resultView = ResultView()
    
    // MARK: - life cycle
    
    init(resultType: SleepType) {
        self.resultType = resultType
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setRoutineTableView()
//        setButtonAction()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        resultView.setupNavigationController(navigationController)
        resultView.setupNavigationItem(navigationItem)
    }
    
//    override func configUI() {
//        titleLabel.text = resultType.typeText
//        emojiImage.image = resultType.typeImage
//        angelNameLabel.text = resultType.angelText + TextLiteral.ResultView.afterAngelText
//        angelNameLabel.applyFont(resultType.angelText, .sb20)
//        angelNameLabel.textAlignment = .center
//        favoriteLabel.setTextWithLineHeight(text: resultType.favoriteText, lineHeight: 27)
//        favoriteLabel.textAlignment = .center
//        contentLabel.setTextWithLineHeight(text: resultType.contentText, lineHeight: 24)
//        super.configUI()
//    }
    
//    private func setRoutineTableView() {
//        routineTableView.delegate = self
//        routineTableView.dataSource = self
//
//        routineTableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.cellId)
//        routineTableView.rowHeight = 60
//        routineTableView.separatorStyle = .none
//        routineTableView.isScrollEnabled = false
//        routineTableView.sectionHeaderTopPadding = 8
//    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToSettingViewController()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
//
//    private func navigateToSettingViewController() {
//        let settingViewController = SettingViewController()
//        settingViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(settingViewController, animated: true)
//    }
}

// MARK: - extension

//extension ResultViewController: UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 17))
//        let header = UILabel()
//        switch section {
//        case 0:
//            header.text = TextLiteral.ResultView.routineHeaderBefore
//        case 1:
//            header.text = TextLiteral.ResultView.routineHeaderDuring
//        case 2:
//            header.text = TextLiteral.ResultView.routineHeaderAfter
//        default:
//            header.text = TextLiteral.ResultView.routineHeaderBefore
//        }
//        header.textColor = .fontBlack
//        header.font = .m14
//        header.frame = CGRect(x: 26, y: 0, width: tableView.bounds.size.width, height: 17)
//        headerView.addSubview(header)
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 17
//    }
//}
//
//extension ResultViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return resultType.routineBeforeArray.count
//        case 1:
//            return TextLiteral.ResultView.duringRoutineArray.count
//        case 2:
//            return resultType.routineAfterArray.count
//        default:
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = routineTableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.cellId, for: indexPath) as! RoutineTableViewCell
//        cell.selectionStyle = .none
//        switch indexPath.section {
//        case 0:
//            cell.cellLabel.text = resultType.routineBeforeArray[indexPath.item]
//            cell.cellEmoji.image = resultType.routineBeforeImage[indexPath.item]
//        case 1:
//            cell.cellLabel.text = TextLiteral.ResultView.duringRoutineArray[indexPath.item]
//            cell.cellEmoji.image = ImageLiteral.duringRoutineImage[indexPath.item]
//        case 2:
//            cell.cellLabel.text = resultType.routineAfterArray[indexPath.item]
//            cell.cellEmoji.image = resultType.routineAfterImage[indexPath.item]
//        default:
//            cell.cellLabel.text = resultType.routineBeforeArray[indexPath.item]
//            cell.cellEmoji.image = resultType.routineBeforeImage[indexPath.item]
//        }
//        return cell
//    }
//}
