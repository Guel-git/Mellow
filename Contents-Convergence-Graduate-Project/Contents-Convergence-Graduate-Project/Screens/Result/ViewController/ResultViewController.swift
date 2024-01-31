//
//  ResultViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/02.
//

import UIKit

import RxSwift

final class ResultViewController: BaseViewController {
    
    private let resultView = ResultView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()
    
    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButtonAction()
        bindViewModel()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        resultView.setupNavigationController(navigationController)
        resultView.setupNavigationItem(navigationItem)
    }
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> ResultViewModel.Output? {
        guard let viewModel = viewModel as? ResultViewModel else { return nil }
        let input = ResultViewModel.Input(
            viewDidLoad: self.rx.viewDidLoad
        )
        return viewModel.transform(from: input)
    }
    
//    private func setButtonAction() {
//        let action = UIAction { [weak self] _ in
//            self?.navigateToSettingViewController()
//        }
//        mainButton.addAction(action, for: .touchUpInside)
//    }
//
//    private func navigateToSettingViewController() {
//        let settingViewController = SettingViewController()
//        settingViewController.navigationItem.hidesBackButton = true
//        self.navigationController?.pushViewController(settingViewController, animated: true)
//    }
}

// MARK: - bind

extension ResultViewController {
    private func bind(output: ResultViewModel.Output?) {
        guard let output else { return }
        
        Observable.combineLatest(output.titleText, output.emojiImage, output.angelText, output.favoriteText, output.contentText, output.routineTableViewHeight)
            .subscribe { [weak self] titleText, emojiImage, angelText, favoriteText, contentText, routineTableViewHeight in
                self?.resultView.setAttribute(titleText, emojiImage, angelText, favoriteText, contentText, routineTableViewHeight)
            }
            .disposed(by: disposeBag)
    }
}
