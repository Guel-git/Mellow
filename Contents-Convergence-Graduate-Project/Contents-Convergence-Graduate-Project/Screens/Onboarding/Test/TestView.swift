//
//  TestView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/18.
//

import UIKit

import RxSwift
import RxCocoa

final class TestView: UIView {
    
    private var answerList = [String]()
    
    // MARK: - ui components
    
    private let backButton = BackButton()
    private let progressBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .dreamPurple50
        view.layer.cornerRadius = 2
        return view
    }()
    private let progressBar: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 2
        view.backgroundColor = .gradientPurpleEnd
        return view
    }()
    private let questionNumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .dreamPurple500
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
    
    // MARK: - publisher
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTableView()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - public func
    
    func setupNavigationController(_ navigation: UINavigationController) {
        navigation.navigationBar.prefersLargeTitles = false
        navigation.navigationBar.tintColor = .fontBlack
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
    }
    
    func setupNavigationItem(_ navigationItem: UINavigationItem) {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesBackButton = true
        
        let backButton = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.questionViewControllerTitle
    }
    
    func setupAttribute(_ questionNumImage: UIImage, _ questionText: String, _ progressRatio: Double, _ progressRadius: CACornerMask, _ mainButtonText: String, _ answerList: [String]) {
        self.questionNumImage.image = questionNumImage
        self.questionLabel.text = questionText
        
        self.progressBar.snp.updateConstraints {
            $0.width.equalTo(progressBackground.snp.width).multipliedBy(progressRatio)
        }
        
        self.progressBar.layoutIfNeeded()
        self.progressBar.setGradient(start: .gradientPurpleStart, end: .gradientPurpleEnd)
        self.progressBar.layer.masksToBounds = true
        self.progressBar.layer.maskedCorners = progressRadius
        
        self.mainButton.title = mainButtonText
        self.answerList = answerList
        self.answerTableView.reloadData()
    }
    
    // MARK: - private func
    
    private func setupTableView() {
        answerTableView.dataSource = self
        answerTableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.cellId)
        answerTableView.rowHeight = 60
        answerTableView.separatorStyle = .none
        answerTableView.isScrollEnabled = false
    }
    
    private func setupLayout() {
        [progressBackground, questionNumImage, questionLabel, answerTableView, mainButton].forEach {
            self.addSubview($0)
        }
        progressBackground.addSubview(progressBar)
        
        progressBackground.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(14)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(4)
        }
        
        progressBar.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(progressBackground.snp.width).multipliedBy(0.25)
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
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
        
        answerTableView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(mainButton.snp.top).inset(-8)
        }
    }
    
}

extension TestView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = answerTableView.dequeueReusableCell(withIdentifier: AnswerTableViewCell.cellId, for: indexPath) as! AnswerTableViewCell
        
        cell.cellLabel.text = answerList[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

//extension TestView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        mainButton.isDisabled = false
//        let weightScore = ["221", "00", "112", "33"]
////        selectedAnswer = questionNum.weightScore[indexPath.item]
////        selectedAnswer = weightScore[indexPath.item]
//    }
//}
