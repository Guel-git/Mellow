//
//  SettingHourViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

import RxSwift

final class SettingHourViewController: BaseViewController {
    
    private let settingHourView = SettingHourView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    var sleepHourChangePublisher = PublishSubject<String>()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = settingHourView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindView()
    }

    // MARK: - private func
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> SettingHourViewModel.Output? {
        guard let viewModel = viewModel as? SettingHourViewModel else { return nil }
        let input = SettingHourViewModel.Input(
            tableViewItemTapped: settingHourView.tableViewTapPublisher,
            mainButtonTapped: settingHourView.mainButtonTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func bindView() {
        settingHourView.cancelButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func reflectSleepHour(_ sleepHour: String) {
        sleepHourChangePublisher.onNext(sleepHour)
        self.dismiss(animated: true)
    }
}

// MARK: - bind

extension SettingHourViewController {
    private func bind(output: SettingHourViewModel.Output?) {
        guard let output = output else { return }
        
        output.sleepHourString
            .subscribe { [weak self] sleepHour in
                self?.reflectSleepHour(sleepHour)
            }
            .disposed(by: disposeBag)
    }
}
