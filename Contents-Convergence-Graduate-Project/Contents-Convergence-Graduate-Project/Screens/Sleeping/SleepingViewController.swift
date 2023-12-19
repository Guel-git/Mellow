//
//  SleepingViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

final class SleepingViewController: BaseViewController {
    
    // MARK: - property
    
    private let duringLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 중.."
        label.textColor = .fontBlack
        label.font = .r20
        return label
    }()
    private let nowTimeLabel: UILabel = {
        let label = UILabel()
        label.text = Date().dateToTimeString
        label.textColor = .fontBlack
        label.font = .sb36
        return label
    }()
    private let wakeTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "알람 07:00"
        label.textColor = .systemSub
        label.font = .m16
        return label
    }()
    private let sleepFavoriteImage = UIImageView(image: ImageLiteral.sleepFavorite)
    private let favoriteLabel: UILabel = {
       let label = UILabel()
        label.text = "꿈에서 만나"
        label.textColor = .fontBlack
        label.font = .r20
        return label
    }()
    private let startButton: StartButton = {
        let button = StartButton()
        button.title = "기상하기"
        button.isGray = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        view.backgroundColor = .systemMain
    }
    
    override func render() {
        [duringLabel, nowTimeLabel, wakeTimeLabel, sleepFavoriteImage, favoriteLabel, startButton].forEach {
            view.addSubview($0)
        }
        
        duringLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(44)
            $0.centerX.equalToSuperview()
        }
        
        nowTimeLabel.snp.makeConstraints {
            $0.top.equalTo(duringLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        wakeTimeLabel.snp.makeConstraints {
            $0.top.equalTo(nowTimeLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        sleepFavoriteImage.snp.makeConstraints {
            $0.top.equalTo(wakeTimeLabel.snp.bottom).offset(64)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(220)
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(sleepFavoriteImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
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
        
        let emptyView = makeBarButtonItem(with: UIView())
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = emptyView
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToRoutineProgressViewController()
        }
        startButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToRoutineProgressViewController() {
        let routineProgressViewController = RoutineProgressViewController(stageNum: 0, isBefore: false)
        navigationController?.pushViewController(routineProgressViewController, animated: true)
    }
}
