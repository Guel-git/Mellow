//
//  QuestionViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/18.
//

import UIKit

import SnapKit

final class QuestionViewController: BaseViewController {
    
    private let answerList = ["배달 앱을 켜고 야식을 시킨다.", "몸에 좋지 않아! 꾹 참는다.", "집에 있는 음식을 찾아 먹는다."]
    
    // MARK: - property

    private let navTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 요정 찾기 테스트"
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let progressBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemSub
        view.layer.cornerRadius = 2
        return view
    }()
    private let progressBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMain
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.layer.cornerRadius = 2
        return view
    }()
    private let questionNumImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.questionOneImage
        imageView.tintColor = .fontBlack
        return imageView
    }()
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "자기 전에 배고픈 당신은?"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let answerTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.isDisabled = true
        button.title = "다음"
        return button
    }()

    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        setupAttribute()
    }
    
    override func render() {
        [navTitleLabel, progressBackground, questionNumImage, questionLabel, answerTableView, mainButton].forEach {
            view.addSubview($0)
        }
        progressBackground.addSubview(progressBar)
        
        navTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(64)
            $0.centerX.equalToSuperview()
        }
        
        progressBackground.snp.makeConstraints {
            $0.top.equalTo(navTitleLabel.snp.bottom).offset(16)
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
        
        answerTableView.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(32)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(52)
        }
    }
    
    private func setupDelegate() {
        answerTableView.delegate = self
        answerTableView.dataSource = self
    }
    
    private func setupAttribute() {
        answerTableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: AnswerTableViewCell.cellId)
        answerTableView.rowHeight = 60
        answerTableView.separatorStyle = .none
        answerTableView.isScrollEnabled = false
    }
    
    
    // MARK: - func
}

// MARK: - extension

extension QuestionViewController: UITableViewDataSource {
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

extension QuestionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainButton.isDisabled = false
    }
}
