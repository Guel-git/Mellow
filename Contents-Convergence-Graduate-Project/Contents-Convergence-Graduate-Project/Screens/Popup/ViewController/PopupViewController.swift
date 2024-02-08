//
//  PopupViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/22.
//

import UIKit

import RxSwift

final class PopupViewController: BaseViewController {
    
    // MARK: - property
    
    private let popupView = PopupView()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getAuthorization()
        bindView()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        popupView.setupNavigationController(navigationController)
        popupView.setupNavigationItem(navigationItem)
    }
    
    private func bindView() {
        popupView.mainButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.navigateToMainViewController()
            }
            .disposed(by: disposeBag)
    }
    
    private func navigateToMainViewController() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    // MARK: - func
    
//    private func getAuthorization() {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            NotificationManager.shared.requestPermission()
//        }
//    }
}
