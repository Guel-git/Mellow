//
//  SettingViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/20.
//

import UIKit

import RxSwift

final class SettingViewController: BaseViewController {
    
    private let settingView = SettingView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: - property
    
    private let settingTimeViewController = SettingTimeViewController()
    private let settingRepeatViewController = SettingRepeatViewController()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = settingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindView()
    }
    
    // MARK: - override
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        settingView.setupNavigationController(navigationController)
        settingView.setupNavigationItem(navigationItem)
    }
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> SettingViewModel.Output? {
        guard let viewModel = viewModel as? SettingViewModel else { return nil }
        let input = SettingViewModel.Input(
            pickerTimeChanged: settingView.pickerTimeChangePublisher,
            mainButtonTapped: settingView.mainButtonTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func bindView() {
        settingView.tableViewTapPublisher
            .subscribe { [weak self] item in
                self?.navigateToDetailViewController(item)
            }
            .disposed(by: disposeBag)
    }
    
//    private func bindSleepTime() {
//        settingTimeViewController.bindSleepTime = { [weak self] timeString in
//            self?.resultArray[0] = timeString
//            self?.settingTableView.reloadData()
//        }
//    }
//
//    private func bindRepeatRoutine() {
//        settingRepeatViewController.bindRepeatRoutine = { [weak self] repeatString in
//            self?.resultArray[1] = repeatString
//            self?.settingTableView.reloadData()
//        }
//    }

    private func navigateToPopupViewController() {
        let popupViewController = PopupViewController()
        navigationController?.pushViewController(popupViewController, animated: true)
    }
    
    private func navigateToDetailViewController(_ item: Int) {
        let viewController = item == 0 ? settingTimeViewController : settingRepeatViewController
        viewController.modalPresentationStyle = .pageSheet
        self.present(viewController, animated: true)
    }
}

// MARK: - bind

extension SettingViewController {
    private func bind(output: SettingViewModel.Output?) {
        guard let output else { return }
        
        output.endSetting
            .subscribe { [weak self] _ in
                self?.navigateToPopupViewController()
            }
            .disposed(by: disposeBag)
    }
}
