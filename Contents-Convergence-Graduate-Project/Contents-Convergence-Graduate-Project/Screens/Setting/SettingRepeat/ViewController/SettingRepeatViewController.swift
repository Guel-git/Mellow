//
//  SettingRepeatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

import RxSwift

final class SettingRepeatViewController: BaseViewController {
    
    private let settingRepeatView = SettingRepeatView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    var sleepRepeatChangePublisher = PublishSubject<String>()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = settingRepeatView
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
    
    private func transformInput() -> SettingRepeatViewModel.Output? {
        guard let viewModel = viewModel as? SettingRepeatViewModel else { return nil }
        let input = SettingRepeatViewModel.Input(
            repeatTableViewItemTapped: settingRepeatView.repeatTableViewTabPublisher,
            dayTableViewItemTapped: settingRepeatView.dayTableViewTabPublisher,
            mainButtonTapped: settingRepeatView.mainButtonTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func bindView() {
        settingRepeatView.cancelButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    
    private func reflectSleepRepeat(_ sleepRepeat: String) {
        sleepRepeatChangePublisher.onNext(sleepRepeat)
        self.dismiss(animated: true)
    }
}

// MARK: - bind

extension SettingRepeatViewController {
    private func bind(output: SettingRepeatViewModel.Output?) {
        guard let output = output else { return }
        
        output.dayTableViewIsHidden
            .subscribe { [weak self] isHidden in
                self?.settingRepeatView.setupDayTableViewVisibility(isHidden)
            }
            .disposed(by: disposeBag)
        
        output.repeatTableViewItemIsSelected
            .subscribe { [weak self] selectedItemArray in
                self?.settingRepeatView.setupRepeatTableViewItemSelected(selectedItemArray)
            }
            .disposed(by: disposeBag)
        
        output.dayTableViewItemsSelected
            .subscribe { [weak self] selectedItemsArray in
                self?.settingRepeatView.setupDayTableViewItemsSelected(selectedItemsArray)
            }
            .disposed(by: disposeBag)
        
        output.sleepRepeatString
            .subscribe { [weak self] sleepRepeat in
                self?.reflectSleepRepeat(sleepRepeat)
            }
            .disposed(by: disposeBag)
    }
}
