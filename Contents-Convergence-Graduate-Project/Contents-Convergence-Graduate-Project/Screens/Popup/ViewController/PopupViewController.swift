//
//  PopupViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/22.
//

import UIKit

final class PopupViewController: BaseViewController {
    
    // MARK: - property
    
    private let popupView = PopupView()
    
    // MARK: - life cycle
    
    override func loadView() {
        view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getAuthorization()
//        setButtonAction()
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
    
    // MARK: - func
    
//    private func getAuthorization() {
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            NotificationManager.shared.requestPermission()
//        }
//    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToMainViewController()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
    
//    private func navigateToMainViewController() {
//        let mainViewController = MainViewController()
//        navigationController?.pushViewController(mainViewController, animated: true)
//    }
}
