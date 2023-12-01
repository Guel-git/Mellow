//
//  SleepingViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/02.
//

import UIKit

final class SleepingViewController: BaseViewController {
    
    // MARK: - property
    
    private let startButton: MainButton = {
        let button = MainButton()
        button.title = "기상하기"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
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
