//
//  RoutineStartViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/28.
//

import UIKit

final class RoutineStartViewController: BaseViewController {
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let beforeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.dotImage
        imageView.tintColor = .systemMain
        return imageView
    }()
    private let beforeLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 전"
        label.textColor = .fontGray
        label.font = .m16
        return label
    }()
    private let beforeDashView = UIView()
    private let beforeTableView = UITableView()
    private let beforeTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "4분\n30초"
        label.textColor = .fontGray
        label.font = .r12
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let duringImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.dotImage
        imageView.tintColor = .systemMain
        return imageView
    }()
    private let duringLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 시작"
        label.textColor = .fontGray
        label.font = .m16
        return label
    }()
    private let duringDashView = UIView()
    private let duringTableView = UITableView()
    private let duringTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "11시간"
        label.textColor = .fontGray
        label.font = .r12
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let afterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.dotImage
        imageView.tintColor = .systemMain
        return imageView
    }()
    private let afterLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 후"
        label.textColor = .fontGray
        label.font = .m16
        return label
    }()
    private let afterDashView = UIView()
    private let afterTableView = UITableView()
    private let afterTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "4분\n30초"
        label.textColor = .fontGray
        label.font = .r12
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = "시작하기"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        setTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        beforeDashView.addDashedLine()
        duringDashView.addDashedLine()
        afterDashView.addDashedLine()
    }
    
    override func render() {
        [scrollView, mainButton].forEach { view.addSubview($0) }
        scrollView.addSubview(contentView)
        [beforeImage, beforeLabel, beforeTableView, beforeDashView, beforeTimeLabel, duringImage, duringLabel, duringTableView, duringDashView, duringTimeLabel, afterImage, afterLabel, afterTableView, afterDashView, afterTimeLabel].forEach {
            contentView.addSubview($0)
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
        
        beforeImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(5)
            $0.height.equalTo(6)
        }
        
        beforeLabel.snp.makeConstraints {
            $0.leading.equalTo(beforeImage.snp.trailing).offset(6)
            $0.centerY.equalTo(beforeImage.snp.centerY)
        }
        
        beforeTableView.snp.makeConstraints {
            $0.top.equalTo(beforeLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.8)
            $0.height.equalTo(264) // 2 - 176, 3 - 264
        }
        
        beforeDashView.snp.makeConstraints {
            $0.trailing.equalTo(beforeTableView.snp.leading).offset(-16)
            $0.width.equalTo(1)
            $0.height.equalTo(265) // 2 - 177, 3 - 265
            $0.centerY.equalTo(beforeTableView.snp.centerY)
        }
        
        beforeTimeLabel.snp.makeConstraints {
            $0.trailing.equalTo(beforeDashView.snp.leading).offset(-10)
            $0.centerY.equalTo(beforeDashView.snp.centerY)
        }
        
        duringImage.snp.makeConstraints {
            $0.top.equalTo(beforeDashView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(5)
            $0.height.equalTo(6)
        }
        
        duringLabel.snp.makeConstraints {
            $0.leading.equalTo(duringImage.snp.trailing).offset(6)
            $0.centerY.equalTo(duringImage.snp.centerY)
        }
        
        duringTableView.snp.makeConstraints {
            $0.top.equalTo(duringLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.8)
            $0.height.equalTo(88)
        }

        duringDashView.snp.makeConstraints {
            $0.trailing.equalTo(duringTableView.snp.leading).offset(-16)
            $0.width.equalTo(1)
            $0.height.equalTo(89)
            $0.centerY.equalTo(duringTableView.snp.centerY)
        }
        
        duringTimeLabel.snp.makeConstraints {
            $0.centerX.equalTo(beforeTimeLabel.snp.centerX)
            $0.centerY.equalTo(duringDashView.snp.centerY)
        }
        
        afterImage.snp.makeConstraints {
            $0.top.equalTo(duringDashView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(5)
            $0.height.equalTo(6)
        }
        
        afterLabel.snp.makeConstraints {
            $0.leading.equalTo(afterImage.snp.trailing).offset(6)
            $0.centerY.equalTo(afterImage.snp.centerY)
        }
        
        afterTableView.snp.makeConstraints {
            $0.top.equalTo(afterLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width * 0.8)
            $0.height.equalTo(264)
        }
        
        afterDashView.snp.makeConstraints {
            $0.trailing.equalTo(afterTableView.snp.leading).offset(-16)
            $0.width.equalTo(1)
            $0.height.equalTo(265)
            $0.centerY.equalTo(afterTableView.snp.centerY)
            $0.bottom.equalTo(0)
        }
        
        afterTimeLabel.snp.makeConstraints {
            $0.centerX.equalTo(beforeTimeLabel.snp.centerX)
            $0.centerY.equalTo(afterDashView.snp.centerY)
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
            self?.navigateToRoutineProgressViewController()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToRoutineProgressViewController() {
//        let routineStartViewController = RoutineStartViewController()
//        navigationController?.pushViewController(routineStartViewController, animated: true)
    }
    
    private func setTableView() {
        [beforeTableView, duringTableView, afterTableView].forEach {
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(RoutineDetailTableViewCell.self, forCellReuseIdentifier: RoutineDetailTableViewCell.cellId)
            $0.rowHeight = 88
            $0.separatorStyle = .none
            $0.isScrollEnabled = false
        }
    }
}

// MARK: - extension

extension RoutineStartViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension RoutineStartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case beforeTableView:
            return 3
        case duringTableView:
            return 1
        case afterTableView:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case beforeTableView:
            let beforeCell = beforeTableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.cellId, for: indexPath) as! RoutineDetailTableViewCell
            beforeCell.selectionStyle = .none
            return beforeCell
        case duringTableView:
            let duringCell = duringTableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.cellId, for: indexPath) as! RoutineDetailTableViewCell
            duringCell.selectionStyle = .none
            return duringCell
        case afterTableView:
            let afterCell = duringTableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.cellId, for: indexPath) as! RoutineDetailTableViewCell
            afterCell.selectionStyle = .none
            return afterCell
        default:
            let beforeCell = beforeTableView.dequeueReusableCell(withIdentifier: RoutineDetailTableViewCell.cellId, for: indexPath) as! RoutineDetailTableViewCell
            beforeCell.selectionStyle = .none
            return beforeCell
        }
    }
}
