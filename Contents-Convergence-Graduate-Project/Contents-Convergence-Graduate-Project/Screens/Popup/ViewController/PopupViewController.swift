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
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = popupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
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
    
    private func bindViewModel() {
        _ = transformInput()
    }
    
    private func transformInput() -> PopupViewModel.Output? {
        guard let viewModel = viewModel as? PopupViewModel else { return nil }
        let input = PopupViewModel.Input(
            viewDidLoad: self.rx.viewDidLoad
        )
        return viewModel.transform(from: input)
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
}
