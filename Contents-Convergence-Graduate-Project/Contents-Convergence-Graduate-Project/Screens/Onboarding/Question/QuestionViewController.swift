//
//  QuestionViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/18.
//

import UIKit

import SnapKit

enum QuestionNum: Int {
    case first = 1
    case second = 2
    case third = 3
    case fourth = 4
    case fifth = 5
    
    var hasBackButton: Bool {
        switch self {
        case .first:
            return false
        case .second, .third, .fourth, .fifth:
            return true
        }
    }
        
    var progressRatio: Double {
        switch self {
        case .first:
            return 0.2
        case .second:
            return 0.4
        case .third:
            return 0.6
        case .fourth:
            return 0.8
        case .fifth:
            return 1.0
        }
    }
    
    var progressRadius: CACornerMask {
        switch self {
        case .first, .second, .third, .fourth:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .fifth:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    var numImage: UIImage {
        switch self {
        case .first:
            return ImageLiteral.questionOneImage
        case .second:
            return ImageLiteral.questionTwoImage
        case .third:
            return ImageLiteral.questionThreeImage
        case .fourth:
            return ImageLiteral.questionFourImage
        case .fifth:
            return ImageLiteral.questionFiveImage
        }
    }
    
    var questionText: String {
        switch self {
        case .first:
            return TextLiteral.questionOne
        case .second:
            return TextLiteral.questionTwo
        case .third:
            return TextLiteral.questionThree
        case .fourth:
            return TextLiteral.questionFour
        case .fifth:
            return TextLiteral.questionFive
        }
    }
    
    var answerList: [String] {
        switch self {
        case .first:
            return TextLiteral.firstAnswerList
        case .second:
            return TextLiteral.secondAnswerList
        case .third:
            return TextLiteral.thirdAnswerList
        case .fourth:
            return TextLiteral.fourthAnswerList
        case .fifth:
            return TextLiteral.firstAnswerList
        }
    }
    
    var mainButtonTitle: String {
        switch self {
        case .first, .second, .third, .fourth:
            return TextLiteral.nextButtonTitle
        case .fifth:
            return TextLiteral.endTestButtonTitle
        }
    }
}

final class QuestionViewController: BaseViewController {
    
    var questionNum: QuestionNum
    
    // MARK: - property

    private let backButton = BackButton()
    private let progressBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 2
        return view
    }()
    private let progressBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMain
        view.layer.cornerRadius = 2
        return view
    }()
    private let questionNumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .fontBlack
        return imageView
    }()
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let answerTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.isDisabled = true
        return button
    }()

    // MARK: - life cycle
    
    init(questionNum: QuestionNum) {
        self.questionNum = questionNum
        super.init()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupAttribute()
        setButtonAction()
    }
    
    override func render() {
        [progressBackground, questionNumImage, questionLabel, answerTableView, mainButton].forEach {
            view.addSubview($0)
        }
        progressBackground.addSubview(progressBar)
        
        progressBackground.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(4)
        }
        
        progressBar.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(progressBackground.snp.width).multipliedBy(questionNum.progressRatio)
        }
        
        questionNumImage.snp.makeConstraints {
            $0.top.equalTo(progressBackground.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(25)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(questionNumImage.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }

        answerTableView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(mainButton.snp.top).inset(-8)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = questionNum.hasBackButton ? backButton : nil
        navigationItem.title = TextLiteral.questionViewControllerTitle
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.m16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupDelegate() {
        answerTableView.delegate = self
        answerTableView.dataSource = self
    }
    
    private func setupAttribute() {
        questionNumImage.image = questionNum.numImage
        questionLabel.text = questionNum.questionText
        progressBar.layer.maskedCorners = questionNum.progressRadius
        mainButton.title = questionNum.mainButtonTitle
        
        answerTableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.cellId)
        answerTableView.rowHeight = 60
        answerTableView.separatorStyle = .none
        answerTableView.isScrollEnabled = false
    }
    
    private func setButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.navigateToNextQuestion()
        }
        mainButton.addAction(action, for: .touchUpInside)
    }
    
    private func navigateToNextQuestion() {
        if questionNum.rawValue == 5 {
            // FIXME: - 결과 화면으로 이동
            let reportViewController = ReportViewController()
            reportViewController.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(reportViewController, animated: true)
        } else {
            let nextNum = questionNum.rawValue + 1
            let questionViewController = QuestionViewController(questionNum: QuestionNum(rawValue: nextNum)!)
            questionViewController.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(questionViewController, animated: true)
        }
    }
}

// MARK: - extension

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionNum.answerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answerTableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.cellId, for: indexPath) as! AnswerTableViewCell
        
        cell.cellLabel.text = questionNum.answerList[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainButton.isDisabled = false
    }
}
