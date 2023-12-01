//
//  RoutineProgressViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/29.
//

import UIKit

final class RoutineProgressViewController: BaseViewController {
    
    var sleepType = UserDefaultManager.sleepType
    var stageNum: Int
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "내일 입을 옷 꺼내두기"
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
    private let routineImage = UIImageView(image: ImageLiteral.clothesImage)
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:56"
        label.textColor = .fontBlack
        label.font = .sb36
        return label
    }()
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("건너뛰기", for: .normal)
        button.setTitle("완료!", for: .highlighted)
        button.setTitleColor(.fontBlack, for: .normal)
        button.setTitleColor(.fontBlack, for: .highlighted)
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
        label.setTextWithLineHeight(text: "내일에 대한 기대감을 높이고,\n아침에 느끼는 의사결정의 피로감을 줄여줘요.", lineHeight: 19)
        label.textColor = .fontGray
        label.font = .m14
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    private let nextRoutineLabel: UILabel = {
        let label = UILabel()
        label.text = "다음 루틴 : 물 떠놓기"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    
    // MARK: - life cycle
    
    init(stageNum: Int) {
        self.stageNum = stageNum
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
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
        navigationItem.title = "수면 전"
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
