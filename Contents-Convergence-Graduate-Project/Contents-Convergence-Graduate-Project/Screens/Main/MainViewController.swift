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
    private let favoriteBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .fontWhite
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        return view
    }()
    private let favoriteImage = UIImageView(image: ImageLiteral.smileMellowImage)
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.text = "재현이"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let favoriteTalkLabel: UILabel = {
        let label = UILabel()
        label.text = "요즘 노력한다던 데, 잘 하고 있나 봐?"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let heartImage = UIImageView(image: ImageLiteral.heartImage)
    private let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "50%"
        label.textColor = .dreamPurple300
        label.font = .m16
        return label
    }()
    private let progressBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .dreamPurple50
        return view
    }()
    private let progressView = UIView()
    private let promiseLabel: UILabel = {
        let label = UILabel()
        label.text = "우리들만의 약속"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let sleepTimeBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .fontWhite
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        return view
    }()
    private let wakeTimeBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .fontWhite
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
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
        label.font = .sb16
        return label
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
        label.font = .sb16
        return label
    }()
    private let repeatBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .fontWhite
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        return view
    }()
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "반복"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    private let repeatCollectionView = RepeatCollectionView()
    private let routineLabel: UILabel = {
        let label = UILabel()
        label.text = "나만의 루틴"
        label.textColor = .fontBlack
        label.font = .sb20
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
        setGradient()
    }
    
    override func configUI() {
        view.setBackgroundGradient(start: .gradientBackgroundStart, end: .gradientBackgroundEnd)
    }
    
    override func render() {
        [favoriteBackView, promiseLabel, sleepTimeBackView, wakeTimeBackView, repeatBackView, routineLabel].forEach {
            view.addSubview($0)
        }
        [favoriteImage, favoriteLabel, favoriteTalkLabel, heartImage, heartLabel, progressBackView].forEach {
            favoriteBackView.addSubview($0)
        }
        progressBackView.addSubview(progressView)
        [sleepImage, sleepLabel, sleepTimeLabel].forEach {
            sleepTimeBackView.addSubview($0)
        }
        [wakeImage, wakeLabel, wakeTimeLabel].forEach {
            wakeTimeBackView.addSubview($0)
        }
        [repeatLabel, repeatCollectionView].forEach {
            repeatBackView.addSubview($0)
        }

        favoriteBackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(115)
        }
        
        favoriteImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(40)
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalTo(favoriteImage.snp.trailing).offset(10)
        }
        
        favoriteTalkLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(6)
            $0.leading.equalTo(favoriteImage.snp.trailing).offset(10)
        }
        
        heartImage.snp.makeConstraints {
            $0.top.equalTo(favoriteImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        heartLabel.snp.makeConstraints {
            $0.centerY.equalTo(heartImage.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        progressBackView.snp.makeConstraints {
            $0.leading.equalTo(heartImage.snp.trailing).offset(4)
            $0.trailing.equalTo(heartLabel.snp.leading).offset(-8)
            $0.centerY.equalTo(heartImage.snp.centerY)
            $0.height.equalTo(10)
        }
        
        progressView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            // FIXME: - 애정도 계산 결과 반영
            $0.width.equalTo(progressBackView.snp.width).multipliedBy(0.5)
            $0.height.equalTo(10)
        }
        
        promiseLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteBackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(16)
        }
        
        sleepTimeBackView.snp.makeConstraints {
            $0.top.equalTo(promiseLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(UIScreen.main.bounds.width * 0.44)
            $0.height.equalTo(82)
        }
        
        wakeTimeBackView.snp.makeConstraints {
            $0.centerY.equalTo(sleepTimeBackView.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(UIScreen.main.bounds.width * 0.44)
            $0.height.equalTo(82)
        }
        
        sleepImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(22)
            $0.width.height.equalTo(34)
        }
        
        sleepLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(sleepImage.snp.trailing).offset(26)
        }
        
        sleepTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalTo(sleepLabel.snp.centerX)
        }
        
        wakeImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(22)
            $0.width.height.equalTo(34)
        }
        
        wakeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(wakeImage.snp.trailing).offset(26)
        }
        
        wakeTimeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.centerX.equalTo(wakeLabel.snp.centerX)
        }
        
        repeatBackView.snp.makeConstraints {
            $0.top.equalTo(sleepTimeBackView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(64)
        }
        
        repeatLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
        }
        
        repeatCollectionView.snp.makeConstraints {
            $0.leading.equalTo(repeatLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(64)
        }
        
        routineLabel.snp.makeConstraints {
            $0.top.equalTo(repeatBackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let menuButton = makeBarButtonItem(with: menuButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = menuButton
        navigationItem.title = "NightMellow"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.dreamPurple500, .font: UIFont.logo]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setGradient() {
        progressView.layoutIfNeeded()
        progressView.setGradient(start: .gradientPurpleStart, end: .gradientPurpleEnd)
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 4
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
