//
//  RoutineDoneViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

final class RoutineDoneViewController: BaseViewController {
    
    let isBefore: Bool
    
    // MARK: - property
    
    private let backButton = BackButton(type: .system)
    private let startButton: MainButton = {
        let button = MainButton()
        button.title = "수면 시작"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    init(isBefore: Bool) {
        self.isBefore = isBefore
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    override func render() {
        [startButton].forEach {
            view.addSubview($0)
        }
        
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
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
        if isBefore {
            let sleepingViewController = SleepingViewController()
            navigationController?.pushViewController(sleepingViewController, animated: true)
        } else {
            let reportViewController = ReportViewController()
            navigationController?.pushViewController(reportViewController, animated: true)
        }
    }
}
