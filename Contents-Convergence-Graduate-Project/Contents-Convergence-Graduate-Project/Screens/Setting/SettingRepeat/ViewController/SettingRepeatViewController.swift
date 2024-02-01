//
//  SettingRepeatViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/21.
//

import UIKit

import RxSwift

final class SettingRepeatViewController: BaseViewController {
    
//    private var selectedIndexArray: [Int] = [] {
//        didSet { settingDayTableView.reloadData() }
//    }
//    var bindRepeatRoutine: ((String) -> ())?
    
    private let settingRepeatView = SettingRepeatView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
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
//        setButtonAction()
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
            repeatTableViewItemTapped: settingRepeatView.repeatTableViewTabPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func bindView() {
        settingRepeatView.cancelButtonPublisher
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true)
            }
            .disposed(by: disposeBag)
    }
    
//    private func setButtonAction() {
//        let confirmAction = UIAction { [weak self] _ in
//            self?.changeRepeatRoutine()
//        }
//        mainButton.addAction(confirmAction, for: .touchUpInside)
//    }
    
//    private func changeRepeatRoutine() {
//        let weekday = [0, 1, 2, 3, 4]
//        let weekend = [5, 6]
//        var indexToString = ""
//        if selectedIndexArray.isEmpty {
//            indexToString = TextLiteral.SettingView.initialRepeatText
//        } else if selectedIndexArray.count == 7 {
//            indexToString = TextLiteral.SettingView.everyDayText
//        } else if weekday == selectedIndexArray.sorted() {
//            indexToString = TextLiteral.SettingView.everyWeekdayText
//        } else if weekend == selectedIndexArray.sorted() {
//            indexToString = TextLiteral.SettingView.everyWeekendText
//        } else {
//            for i in 0..<7 {
//                if selectedIndexArray.contains(i) {
//                    indexToString += (TextLiteral.SettingView.repeatTableViewDictionary[i] ?? "") + TextLiteral.SettingView.commaText
//                }
//            }
//            indexToString.removeSubrange(indexToString.index(indexToString.endIndex, offsetBy: -2)..<indexToString.endIndex)
//        }
//        bindRepeatRoutine?(indexToString)
//        self.dismiss(animated: true)
//    }
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
    }
}
