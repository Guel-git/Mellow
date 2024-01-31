//
//  ResultView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/31.
//

import UIKit

import RxSwift
import RxCocoa

final class ResultView: UIView {
    
    private var beforeTextArray = [String]()
    private var afterTextArray = [String]()
    private var beforeImageArray = [UIImage]()
    private var afterImageArray = [UIImage]()
    
    // MARK: - ui components
    
    private let backButton = BackButton()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.ResultView.subTitleText
        label.textColor = .fontBlack
        label.font = .m24
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .sb30
        return label
    }()
    private let emojiImage = UIImageView()
    private let angelLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.ResultView.previousAngelText
        label.textColor = .fontBlack
        label.font = .r20
        return label
    }()
    private let angelNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .r20
        return label
    }()
    private let favoriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemSub
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .m18
        label.numberOfLines = 0
        return label
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontBlack
        label.font = .m16
        label.numberOfLines = 0
        return label
    }()
    private let routineLabel: UILabel = {
        let label = UILabel()
        label.text = TextLiteral.ResultView.routineText
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let routineTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = TextLiteral.ResultView.mainButtonText
        button.isDisabled = false
        return button
    }()
    
    // MARK: - publisher
    
    var mainButtonTapPublisher: Observable<Void> {
        return mainButton.rx.tap.asObservable()
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupRoutineTableView()
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
    
    func setupAttribute(_ titleText: String, _ emojiImage: UIImage, _ angelText: String, _ favoriteText: String, _ contentText: String) {
        self.titleLabel.text = titleText
        self.emojiImage.image = emojiImage
        self.angelNameLabel.text = angelText + TextLiteral.ResultView.afterAngelText
        self.angelNameLabel.applyFont(angelText, .sb20)
        self.angelNameLabel.textAlignment = .center
        self.favoriteLabel.setTextWithLineHeight(text: favoriteText, lineHeight: 27)
        self.favoriteLabel.textAlignment = .center
        self.contentLabel.setTextWithLineHeight(text: contentText, lineHeight: 24)
    }
    
    func setupTableViewAttribute(_ routineTableViewHeight: Int, _ routineBeforeImage: [UIImage], _ routineAfterImage: [UIImage], _ routineBeforeText: [String], _ routineAfterText: [String]) {
        self.routineTableView.snp.updateConstraints {
            $0.height.equalTo(routineTableViewHeight)
        }
        self.beforeTextArray = routineBeforeText
        self.afterTextArray = routineAfterText
        self.beforeImageArray = routineBeforeImage
        self.afterImageArray = routineAfterImage
        self.routineTableView.reloadData()
    }
    
    // MARK: - private func
    
    private func setupLayout() {
        [scrollView, mainButton].forEach { self.addSubview($0) }
        scrollView.addSubview(contentView)
        [subTitleLabel, titleLabel, emojiImage, angelLabel, angelNameLabel, favoriteImage, favoriteLabel, contentLabel, routineLabel, routineTableView].forEach {
            contentView.addSubview($0)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(mainButton.snp.top).offset(-12)
        }
        
        contentView.snp.makeConstraints {
            $0.width.edges.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        emojiImage.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
        angelLabel.snp.makeConstraints {
            $0.top.equalTo(emojiImage.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        angelNameLabel.snp.makeConstraints {
            $0.top.equalTo(angelLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        
        favoriteImage.snp.makeConstraints {
            $0.top.equalTo(angelNameLabel.snp.bottom).offset(16)
            $0.width.height.equalTo(200)
            $0.centerX.equalToSuperview()
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        
        routineLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }
        
        routineTableView.snp.makeConstraints {
            $0.top.equalTo(routineLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(SleepType.Baby.routineDetailViewHeight)
            $0.bottom.equalTo(-16)
        }
    }
    
    private func setupRoutineTableView() {
        routineTableView.delegate = self
        routineTableView.dataSource = self
        
        routineTableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.cellId)
        routineTableView.rowHeight = 60
        routineTableView.separatorStyle = .none
        routineTableView.isScrollEnabled = false
        routineTableView.sectionHeaderTopPadding = 8
    }
}

extension ResultView: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 17))
        let header = UILabel()
        switch section {
        case 0:
            header.text = TextLiteral.ResultView.routineHeaderBefore
        case 1:
            header.text = TextLiteral.ResultView.routineHeaderDuring
        case 2:
            header.text = TextLiteral.ResultView.routineHeaderAfter
        default:
            header.text = TextLiteral.ResultView.routineHeaderBefore
        }
        header.textColor = .fontBlack
        header.font = .m14
        header.frame = CGRect(x: 26, y: 0, width: tableView.bounds.size.width, height: 17)
        headerView.addSubview(header)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 17
    }
}

extension ResultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return beforeTextArray.count
        case 1:
            return TextLiteral.ResultView.duringRoutineArray.count
        case 2:
            return afterTextArray.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = routineTableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.cellId, for: indexPath) as! RoutineTableViewCell
        cell.selectionStyle = .none
        switch indexPath.section {
        case 0:
            cell.cellLabel.text = beforeTextArray[indexPath.item]
            cell.cellEmoji.image = beforeImageArray[indexPath.item]
        case 1:
            cell.cellLabel.text = TextLiteral.ResultView.duringRoutineArray[indexPath.item]
            cell.cellEmoji.image = ImageLiteral.duringRoutineImage[indexPath.item]
        case 2:
            cell.cellLabel.text = afterTextArray[indexPath.item]
            cell.cellEmoji.image = afterImageArray[indexPath.item]
        default:
            cell.cellLabel.text = beforeTextArray[indexPath.item]
            cell.cellEmoji.image = beforeImageArray[indexPath.item]
        }
        return cell
    }
}
