//
//  MainViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/28.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // MARK: - property
    
    private let menuButton = MenuButton(type: .system)
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "최애"
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let favoriteImage = UIImageView(image: ImageLiteral.mainFavorite)
    private let favoriteTalkLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "어제 수면 시간에 핸드폰 했지?\n정말 실망이야.", lineHeight: 26)
        label.textColor = .fontBlack
        label.font = .r20
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    private let heartImage = UIImageView(image: ImageLiteral.heartImage)
    private let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "63%"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let progressBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 4
        return view
    }()
    private let progressView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMain
        view.layer.cornerRadius = 4
        return view
    }()
    private let promiseLabel: UILabel = {
        let label = UILabel()
        label.text = "우리만의 약속"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let sleepBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 8
        return view
    }()
    private let sleepImage = UIImageView(image: ImageLiteral.moonImage)
    private let sleepLabel: UILabel = {
        let label = UILabel()
        label.text = "취침 시간"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    private let sleepTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "23:00"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let wakeBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 8
        return view
    }()
    private let wakeImage = UIImageView(image: ImageLiteral.sunImage)
    private let wakeLabel: UILabel = {
        let label = UILabel()
        label.text = "기상 시간"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    private let wakeTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "07:00"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let mainButton: StartButton = {
        let button = StartButton()
        button.title = "잠들기 준비"
        button.isGray = true
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    override func render() {
        [favoriteLabel, favoriteImage, favoriteTalkLabel, heartImage, heartLabel, progressBackView, progressView, promiseLabel, sleepBackView, wakeBackView, mainButton].forEach {
            view.addSubview($0)
        }
        [sleepImage, sleepLabel, sleepTimeLabel].forEach {
            sleepBackView.addSubview($0)
        }
        [wakeImage, wakeLabel, wakeTimeLabel].forEach {
            wakeBackView.addSubview($0)
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        favoriteImage.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(16)
            $0.width.height.equalTo(220)
            $0.centerX.equalToSuperview()
        }
        
        favoriteTalkLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        heartImage.snp.makeConstraints {
            $0.top.equalTo(favoriteTalkLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        heartLabel.snp.makeConstraints {
            $0.centerY.equalTo(heartImage.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        progressBackView.snp.makeConstraints {
            $0.centerY.equalTo(heartImage.snp.centerY)
            $0.leading.equalTo(heartImage.snp.trailing).offset(8)
            $0.trailing.equalTo(heartLabel.snp.leading).offset(-8)
            $0.height.equalTo(10)
        }
        
        progressView.snp.makeConstraints {
            $0.centerY.equalTo(progressBackView.snp.centerY)
            $0.leading.equalTo(progressBackView.snp.leading)
            $0.width.equalTo(progressBackView.snp.width).multipliedBy(0.63)
            $0.height.equalTo(10)
        }
        
        promiseLabel.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(55)
            $0.centerX.equalToSuperview()
        }
        
        sleepBackView.snp.makeConstraints {
            $0.top.equalTo(promiseLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview().offset(-78)
            $0.width.equalTo(140)
            $0.height.equalTo(82)
        }
        
        sleepImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(34)
            $0.width.height.equalTo(16)
        }
        
        sleepLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(34)
        }
        
        sleepTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        wakeBackView.snp.makeConstraints {
            $0.top.equalTo(promiseLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview().offset(78)
            $0.width.equalTo(140)
            $0.height.equalTo(82)
        }
        
        wakeImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.leading.equalToSuperview().inset(34)
            $0.width.height.equalTo(16)
        }
        
        wakeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.trailing.equalToSuperview().inset(34)
        }
        
        wakeTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(103)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let menuButton = makeBarButtonItem(with: menuButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = menuButton
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToRoutineStartViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToRoutineStartViewController() {
        let routineStartViewController = RoutineStartViewController()
        navigationController?.pushViewController(routineStartViewController, animated: true)
    }
}
