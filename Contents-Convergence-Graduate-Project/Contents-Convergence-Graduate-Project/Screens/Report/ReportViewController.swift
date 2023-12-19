//
//  ReportViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

final class ReportViewController: BaseViewController {
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let bannerBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBack
        return view
    }()
    private let bannerDateLabel: UILabel = {
        let label = UILabel()
        label.text = Date().dateToKoreanString
        label.textColor = .fontGray
        label.font = .m16
        return label
    }()
    private let bannerLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "최애와\n함께한 수면 분석", lineHeight: 29)
        label.textColor = .fontBlack
        label.font = .sb24
        label.numberOfLines = 2
        return label
    }()
    private let reportFavorite = UIImageView(image: ImageLiteral.reportFavorite)
    private let sleepTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 시간"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let sleepBackView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.systemBack.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    private let sleepDarkView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemDark
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        return view
    }()
    private let totalTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "총 수면 시간"
        label.textColor = .white
        label.font = .m16
        return label
    }()
    private let totalTime: UILabel = {
        let label = UILabel()
        label.text = "7시간 30분"
        label.textColor = .white
        label.font = .sb24
        return label
    }()
    private let timeSlashLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let sleepStartLabel: UILabel = {
       let label = UILabel()
        label.text = "수면 시각"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let sleepStartTime: UILabel = {
        let label = UILabel()
        label.text = "23:30"
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let sleepEndLabel: UILabel = {
       let label = UILabel()
        label.text = "기상 시각"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let sleepEndTime: UILabel = {
        let label = UILabel()
        label.text = "07:00"
        label.textColor = .fontBlack
        label.font = .sb24
        return label
    }()
    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 요약"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let summaryBackView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemBack
        return view
    }()
    private let checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.answerCheckImage
        imageView.tintColor = .fontBlack
        return imageView
    }()
    private let checkLabel: UILabel = {
        let label = UILabel()
        label.text = "루틴을 모두 성공했어요"
        label.textColor = .fontBlack
        label.font = .m16
        return label
    }()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = "다음"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    override func render() {
        [scrollView, mainButton].forEach {
            view.addSubview($0)
        }
        scrollView.addSubview(contentView)
        [bannerBackView, sleepTimeLabel, sleepBackView, summaryLabel, summaryBackView, checkImage, checkLabel].forEach {
            contentView.addSubview($0)
        }
        [bannerDateLabel, bannerLabel, reportFavorite].forEach {
            bannerBackView.addSubview($0)
        }
        [sleepDarkView, totalTimeLabel, totalTime, timeSlashLabel, sleepStartLabel, sleepStartTime, sleepEndLabel, sleepEndTime].forEach {
            sleepBackView.addSubview($0)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(mainButton.snp.top).offset(-12)
        }
        
        contentView.snp.makeConstraints {
            $0.width.edges.equalToSuperview()
        }
        
        bannerBackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(262)
        }
        
        bannerDateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bannerLabel.snp.makeConstraints {
            $0.top.equalTo(bannerDateLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        reportFavorite.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(142)
        }
        
        sleepTimeLabel.snp.makeConstraints {
            $0.top.equalTo(bannerBackView.snp.bottom).offset(33)
            $0.leading.equalToSuperview().inset(16)
        }
        
        sleepBackView.snp.makeConstraints {
            $0.top.equalTo(sleepTimeLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(176)
        }
        
        sleepDarkView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(88)
        }
        
        totalTimeLabel.snp.makeConstraints {
            $0.top.equalTo(16)
            $0.centerX.equalToSuperview()
        }
        
        totalTime.snp.makeConstraints {
            $0.top.equalTo(totalTimeLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        timeSlashLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        sleepStartLabel.snp.makeConstraints {
            $0.top.equalTo(sleepDarkView.snp.bottom).offset(16)
            $0.trailing.equalTo(timeSlashLabel.snp.leading).offset(-36)
        }
        
        sleepStartTime.snp.makeConstraints {
            $0.centerX.equalTo(sleepStartLabel.snp.centerX)
            $0.top.equalTo(sleepStartLabel.snp.bottom).offset(8)
        }
        
        sleepEndLabel.snp.makeConstraints {
            $0.top.equalTo(sleepDarkView.snp.bottom).offset(16)
            $0.leading.equalTo(timeSlashLabel.snp.trailing).offset(36)
        }
        
        sleepEndTime.snp.makeConstraints {
            $0.centerX.equalTo(sleepEndLabel.snp.centerX)
            $0.top.equalTo(sleepEndLabel.snp.bottom).offset(8)
        }
        
        summaryLabel.snp.makeConstraints {
            $0.top.equalTo(sleepBackView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        summaryBackView.snp.makeConstraints {
            $0.top.equalTo(summaryLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(152)
            $0.bottom.equalTo(-16)
        }
        
        checkImage.snp.makeConstraints {
            $0.top.equalTo(summaryBackView.snp.top).offset(21)
            $0.leading.equalTo(summaryBackView.snp.leading).offset(16)
            $0.width.height.equalTo(18)
        }
        
        checkLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkImage.snp.centerY)
            $0.leading.equalTo(checkImage.snp.trailing).offset(6)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = "수면 리포트"
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToMainViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToMainViewController() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}
