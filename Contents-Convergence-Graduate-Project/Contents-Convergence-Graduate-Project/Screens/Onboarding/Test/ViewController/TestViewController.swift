//
//  TestViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/18.
//

import UIKit

import RxSwift

final class TestViewController: BaseViewController {
    
    private let testView = TestView()
    private let viewModel: any ViewModelType
    private let disposeBag = DisposeBag()

    // MARK: - life cycle
    
    init(viewModel: any ViewModelType) {
        self.viewModel = viewModel
        super.init()
    }

    required init?(coder: NSCoder) { nil }
    
    override func loadView() {
        view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    // MARK: - override
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        configureNavigationController()
    }
    
    // MARK: - private func
    
    private func configureNavigationController() {
        guard let navigationController else { return }
        testView.setupNavigationController(navigationController)
        testView.setupNavigationItem(navigationItem)
    }
    
    private func bindViewModel() {
        let output = transformInput()
        bind(output: output)
    }
    
    private func transformInput() -> TestViewModel.Output? {
        guard let viewModel = viewModel as? TestViewModel else { return nil }
        let input = TestViewModel.Input(
            viewDidLoad: self.rx.viewDidLoad,
            answerItemTapped: testView.answerItemTapPublisher,
            mainButtonTapped: testView.mainButtonTapPublisher
        )
        return viewModel.transform(from: input)
    }
    
    private func navigateToTestViewController(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - bind

extension TestViewController {
    private func bind(output: TestViewModel.Output?) {
        guard let output else { return }
        
        Observable.combineLatest(output.questionNumImage, output.questionText, output.progressRatio, output.progressRadius, output.mainButtonText, output.answerList)
            .subscribe { [weak self] questionNumImage, questionText, progressRatio, progressRadius, mainButtonText, answerList in
                self?.testView.setupAttribute(questionNumImage, questionText, progressRatio, progressRadius, mainButtonText, answerList)
            }
            .disposed(by: disposeBag)
        
        output.answerItemSelectionDidEnd
            .subscribe { [weak self] isEnabled in
                self?.testView.activateMainButton(isEnabled)
            }
            .disposed(by: disposeBag)
        
        output.answeringDidEnd
            .subscribe { [weak self] viewController in
                self?.navigateToTestViewController(viewController: viewController)
            }
            .disposed(by: disposeBag)
    }
}
