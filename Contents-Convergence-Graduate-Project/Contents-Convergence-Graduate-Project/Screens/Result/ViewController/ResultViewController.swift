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
    
    private func bindView() {
        resultView.mainButtonTapPublisher
            .subscribe { [weak self] _ in
                self?.navigateToSettingViewController()
            }
            .disposed(by: disposeBag)
    }

    private func navigateToSettingViewController() {
        let settingViewController = SettingViewController()
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}

// MARK: - bind

extension ResultViewController {
    private func bind(output: ResultViewModel.Output?) {
        guard let output else { return }
        
        Observable.combineLatest(output.titleText, output.emojiImage, output.angelText, output.favoriteText, output.contentText)
            .subscribe { [weak self] titleText, emojiImage, angelText, favoriteText, contentText in
                self?.resultView.setupAttribute(titleText, emojiImage, angelText, favoriteText, contentText)
            }
            .disposed(by: disposeBag)
        
        Observable.combineLatest(output.routineTableViewHeight, output.routineBeforeImage, output.routineAfterImage, output.routineBeforeText, output.routineAfterText)
            .subscribe { [weak self] routineTableViewHeight, routineBeforeImage, routineAfterImage, routineBeforeText, routineAfterText in
                self?.resultView.setupTableViewAttribute(routineTableViewHeight, routineBeforeImage, routineAfterImage, routineBeforeText, routineAfterText)
            }
            .disposed(by: disposeBag)
    }
}
