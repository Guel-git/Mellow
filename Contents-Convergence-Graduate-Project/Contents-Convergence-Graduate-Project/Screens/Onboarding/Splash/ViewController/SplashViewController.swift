//
//  SplashViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/23.
//

import UIKit

import RxSwift

final class SplashViewController: BaseViewController {
    
    // MARK: - property
    
    private let splashView = SplashView()
    private let disposeBag = DisposeBag()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
    }
    
    
    // MARK: - private func
    
    private func bindView() {
        splashView.mainButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.navigateToChatViewController()
            }
            .disposed(by: disposeBag)
    }
    
    private func navigateToChatViewController() {
        let viewModel = ChatViewModel()
        let chatViewController = ChatViewController(viewModel: viewModel)
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}
