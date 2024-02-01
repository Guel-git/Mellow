//
//  SettingHourViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

import RxSwift

final class SettingHourViewController: BaseViewController {
    
//    private var selectedIndex: Int = 0 {
//        didSet { settingTimeTableView.reloadData() }
//    }
//    var bindSleepTime: ((String) -> ())?
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
//        setButtonAction()
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
    
    private func reflectSleepTime(_ sleepTime: String) {
        sleepHourChangePublisher.onNext(sleepTime)
        self.dismiss(animated: true)
    }
    
//    private func setButtonAction() {
//        let confirmAction = UIAction { [weak self] _ in
//            self?.changeSleepTime()
//        }
//        mainButton.addAction(confirmAction, for: .touchUpInside)
//    }
//
//    private func changeSleepTime() {
//        guard let timeString = TextLiteral.SettingView.timeTableViewDictionary[selectedIndex] else { return }
//        bindSleepTime?(timeString)
//        self.dismiss(animated: true)
//    }
}

// MARK: - bind

extension SettingHourViewController {
    private func bind(output: SettingHourViewModel.Output?) {
        guard let output = output else { return }
        
        output.sleepHourString
            .subscribe { [weak self] sleepTime in
                self?.reflectSleepTime(sleepTime)
            }
            .disposed(by: disposeBag)
    }
}
