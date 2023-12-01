//
//  RoutineProgressViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import UIKit

final class RoutineProgressViewController: BaseViewController {
    
    private var sleepType = SleepType(rawValue: UserDefaultManager.sleepType)
    private let isBefore: Bool
    private let stageNum: Int
    private let firstTime = Date()
    
    private var countdownTimer: Timer?
    private var targetTime: TimeInterval?
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let circularView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 110
        view.layer.borderColor = UIColor.systemSub.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    private let routineImage = UIImageView()
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .fontBlack
        label.font = .sb36
        return label
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("건너뛰기", for: .normal)
        button.setTitleColor(.fontBlack, for: .normal)
        button.backgroundColor = .systemSub
        button.titleLabel?.font = .m16
        button.layer.cornerRadius = 8
        return button
    }()
    private let descriptionBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 4
        return view
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontGray
        label.font = .m14
        label.numberOfLines = 2
        return label
    }()
    private let nextRoutineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    
    // MARK: - life cycle
    
    init(stageNum: Int, isBefore: Bool) {
        self.stageNum = stageNum
        self.isBefore = isBefore
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        targetTime = TimeInterval(Int(isBefore ? (sleepType?.routineBeforeTime[stageNum] ?? "0") : (sleepType?.routineAfterTime[stageNum] ?? "0"))!)
        startTimer()
        titleLabel.text = isBefore ? sleepType?.routineBeforeArray[stageNum] : sleepType?.routineAfterArray[stageNum + 1]
        routineImage.image = isBefore ? sleepType?.routineBeforeImage[stageNum] : sleepType?.routineAfterImage[stageNum + 1]
        descriptionLabel.setTextWithLineHeight(text: isBefore ? sleepType?.routineBeforeContentArray[stageNum] : sleepType?.routineAfterContentArray[stageNum], lineHeight: 19)
        descriptionLabel.textAlignment = .center
        let count = isBefore ? (sleepType?.routineBeforeArray.count ?? 0) : (sleepType?.routineAfterArray.count ?? 0) - 1
        if stageNum < count - 1 {
            nextRoutineLabel.text = "다음 루틴 : " + (isBefore ? (sleepType?.routineBeforeArray[stageNum + 1] ?? String()) : (sleepType?.routineAfterArray[stageNum + 1] ?? String()))
        }
        setButtonAction()
    }
    
    override func render() {
        [titleLabel, circularView, timerLabel, nextButton, descriptionBackView, nextRoutineLabel].forEach {
            view.addSubview($0)
        }
        circularView.addSubview(routineImage)
        descriptionBackView.addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        circularView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(220)
        }
        
        routineImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(93)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(circularView.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(timerLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(52)
        }
        
        descriptionBackView.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(54)
            $0.leading.trailing.equalToSuperview().inset(26)
            $0.height.equalTo(56)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        nextRoutineLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionBackView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = isBefore ? "수면 전" : "수면 후"
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToNextRoutine()
        }
        nextButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToNextRoutine() {
        if isBefore {
            let beforeCount = sleepType?.routineBeforeArray.count ?? 0
            if stageNum < beforeCount - 1 {
                let routineProgressViewController = RoutineProgressViewController(stageNum: stageNum + 1, isBefore: true)
                navigationController?.pushViewController(routineProgressViewController, animated: true)
            } else {
                let routineDoneViewController = RoutineDoneViewController(isBefore: true)
                navigationController?.pushViewController(routineDoneViewController, animated: true)
            }
        } else {
            let afterCount = sleepType?.routineAfterTime.count ?? 0
            if stageNum < afterCount - 1 {
                let routineProgressViewController = RoutineProgressViewController(stageNum: stageNum + 1, isBefore: false)
                navigationController?.pushViewController(routineProgressViewController, animated: true)
            } else {
                let routineDoneViewController = RoutineDoneViewController(isBefore: false)
                navigationController?.pushViewController(routineDoneViewController, animated: true)
            }
        }
    }

    private func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc private func updateTimer() {
        guard let targetTime = targetTime else { return }
        
        let currentTime = Date()
        let target = firstTime.addingTimeInterval(targetTime)
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute, .second], from: currentTime, to: target)
        
        if let minute = components.minute, let second = components.second {
            let formattedString = String(format: "%02d:%02d", minute, second)
            timerLabel.text = formattedString
            
            if minute == 0, second == 0 {
                countdownTimer?.invalidate()
            }
        }
    }
}
