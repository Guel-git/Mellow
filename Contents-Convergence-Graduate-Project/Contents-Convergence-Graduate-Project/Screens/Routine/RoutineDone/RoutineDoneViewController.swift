//
//  RoutineDoneViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

final class RoutineDoneViewController: BaseViewController {
        
    private let sleepType = SleepType(rawValue: UserDefaultManager.sleepType) ?? SleepType.Zombie
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let feedbackEmoji = UIImageView(image: ImageLiteral.happyImage)
    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "오늘의 수면 루틴을 모두 달성했어요!\n너무 대단해요!!", lineHeight: 24)
        label.textColor = .fontBlack
        label.font = .m16
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    private let beforeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.dotImage
        imageView.tintColor = .systemMain
        return imageView
    }()
    private let beforeLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.RoutineStartView.beforeLabelText
        label.textColor = .fontGray
        label.font = .m16
        return label
    }()
    private let beforeDashView = UIView()
    private let beforeTableView = UITableView()
    private let beforeTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontGray
        label.font = .r12
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let startButton: StartButton = {
        let button = StartButton()
        button.title = "수면 시작"
        button.isGray = true
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addDashLine()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        setTableView()
        setTimeLabel()
    }
    
    override func render() {
        [feedbackEmoji, feedbackLabel, beforeImage, beforeLabel, beforeTableView, beforeDashView, beforeTimeLabel, startButton].forEach {
            view.addSubview($0)
        }
        
        feedbackEmoji.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(93)
        }
        
        feedbackLabel.snp.makeConstraints {
            $0.top.equalTo(feedbackEmoji.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        beforeImage.snp.makeConstraints {
            $0.top.equalTo(feedbackLabel.snp.bottom).offset(39)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(5)
            $0.height.equalTo(6)
        }
        
        beforeLabel.snp.makeConstraints {
            $0.centerY.equalTo(beforeImage.snp.centerY)
            $0.leading.equalTo(beforeImage.snp.trailing).offset(8)
        }
        
        beforeTableView.snp.makeConstraints {
            $0.top.equalTo(beforeLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.8)
            $0.height.equalTo(sleepType.routineDetailViewHeight)
        }
        
        beforeDashView.snp.makeConstraints {
            $0.trailing.equalTo(beforeTableView.snp.leading).offset(-16)
            $0.width.equalTo(1)
            $0.height.equalTo(sleepType.routineDetailViewHeight + 1)
            $0.centerY.equalTo(beforeTableView.snp.centerY)
        }
        
        beforeTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(beforeDashView.snp.leading).offset(-14)
            $0.centerY.equalTo(beforeDashView.snp.centerY)
        }
        
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(103)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "추천 수면 루틴"
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToNextViewController()
        }
        startButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToNextViewController() {
        let sleepingViewController = SleepingViewController()
        navigationController?.pushViewController(sleepingViewController, animated: true)
    }
    
    private func setTableView() {
        beforeTableView.delegate = self
        beforeTableView.dataSource = self
            
        beforeTableView.register(RoutineDetailTableViewCell.self, forCellReuseIdentifier: RoutineDetailTableViewCell.cellId)
        beforeTableView.rowHeight = 88
        beforeTableView.separatorStyle = .none
        beforeTableView.isScrollEnabled = false
    }
    
    private func addDashLine() {
        beforeDashView.addDashedLine()
    }
    
    private func setTimeLabel() {
        var totalBeforeTime = 0
        sleepType.routineBeforeTime.forEach {
            totalBeforeTime += Int($0)!
        }
        beforeTimeLabel.text = String(totalBeforeTime).secondToMinuteWithSpacing()
    }
}

// MARK: - extension

extension RoutineDoneViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension RoutineDoneViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sleepType.routineBeforeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = beforeTableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.cellId, for: indexPath) as! RoutineDetailTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = sleepType.routineBeforeArray[indexPath.item]
        cell.cellImage.image = sleepType.routineBeforeImage[indexPath.item]
        cell.cellSubLabel.text = TextLiteral.RoutineStartView.recommendTimeText + sleepType.routineBeforeTime[indexPath.item].secondToMinute()
        return cell
    }
}
