//
//  ResultViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/11/02.
//

import UIKit

final class ResultViewController: BaseViewController {
    
    private let routineBeforeArray = ["미션 시작 시간 지키기", "방 불 끄기", "물 떠놓기", "양치 및 세수 하기"]
    private let routineAfterArray = ["기상 시간 지키기", "핸드폰 사용하지 않기", "떠놓은 물 마시기", "밝은 빛 보기 - 커튼 열기"]
    
    // MARK: - property
    
    private let backButton = BackButton()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "당신의 수면 타입은"
        label.textColor = .fontBlack
        label.font = .m24
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "잠이 많은 타입!"
        label.textColor = .fontBlack
        label.font = .sb30
        return label
    }()
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "⏰😴😵💦"
        label.font = .sb30
        return label
    }()
    private let angelLabel: UILabel = {
        let label = UILabel()
        label.text = "당신의 수면 요정은 갓생캐에요!"
        label.textColor = .fontBlack
        label.font = .r20
        return label
    }()
    private let favoriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.favoriteImage
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        return imageView
    }()
    private let favoriteLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "“ 언제나 맡은 일을 해내죠.\n믿고 맡겨만 주세요.”", lineHeight: 27)
        label.textColor = .fontBlack
        label.font = .m18
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.setTextWithLineHeight(text: "수면은 우리 일상에서 중요한 부분이며, 많은 측면에서 우리 건강과 행복에 큰 영향을 미칩니다. 그러나 현대 사회에서는 바쁜 일정, 스트레스, 디지털 기기의 사용, 나쁜 습관 등으로 인해 수면 문제가 더욱 흔해지고 있습니다. 이로 인해 많은 사람들의 일상이 수면 부족으로 인해 무너져가고 있습니다. 그러므로, 지금 당장 수면 습관을 세우고 규칙적인 잠을 자는 것이 중요합니다.", lineHeight: 24)
        label.textColor = .fontBlack
        label.font = .m16
        label.numberOfLines = 0
        return label
    }()
    private let routineLabel: UILabel = {
        let label = UILabel()
        label.text = "당신을 위한 추천 수면 루틴"
        label.textColor = .fontBlack
        label.font = .sb20
        return label
    }()
    private let routineTableView = UITableView()
    private let mainButton: MainButton = {
        let button = MainButton()
        button.title = "규칙적인 수면 시작하기"
        button.isDisabled = false
        return button
    }()
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRoutineTableView()
    }
    
    override func render() {
        [scrollView, mainButton].forEach { view.addSubview($0) }
        scrollView.addSubview(contentView)
        [subTitleLabel, titleLabel, emojiLabel, angelLabel, favoriteImage, favoriteLabel, contentLabel, routineLabel, routineTableView].forEach {
            contentView.addSubview($0)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(8)
            $0.height.equalTo(52)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        angelLabel.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.bottom).offset(38)
            $0.centerX.equalToSuperview()
        }
        
        favoriteImage.snp.makeConstraints {
            $0.top.equalTo(angelLabel.snp.bottom).offset(16)
            $0.width.height.equalTo(200)
            $0.centerX.equalToSuperview()
        }
        
        favoriteLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteImage.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(38)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        
        routineLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }
        
        routineTableView.snp.makeConstraints {
            $0.top.equalTo(routineLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            // FIXME: - 수면 요정 유형에 따라 height 조정하기
            $0.height.equalTo(532)
            $0.bottom.equalTo(-16)
        }
    }
    
    // MARK: - func
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = TextLiteral.questionViewControllerTitle
        navigationController?.navigationBar.tintColor = .fontBlack
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBlack, NSAttributedString.Key.font: UIFont.sb16]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setRoutineTableView() {
        routineTableView.delegate = self
        routineTableView.dataSource = self
        
        routineTableView.register(RoutineTableViewCell.self, forCellReuseIdentifier: RoutineTableViewCell.cellId)
        routineTableView.rowHeight = 60
        routineTableView.separatorStyle = .none
        routineTableView.isScrollEnabled = false
        routineTableView.sectionHeaderTopPadding = 8
    }
}

// MARK: - extension

extension ResultViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 17))
        let header = UILabel()
        header.text = section == 0 ? "수면 전" : "수면 후"
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

extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? routineBeforeArray.count : routineAfterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = routineTableView.dequeueReusableCell(withIdentifier: RoutineTableViewCell.cellId, for: indexPath) as! RoutineTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = indexPath.section == 0 ? routineBeforeArray[indexPath.item] : routineAfterArray[indexPath.item]
        return cell
    }
}
