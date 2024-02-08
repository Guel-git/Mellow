//
//  RoutineView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/08.
//

import UIKit

import SnapKit

final class RoutineView: UIView {
    
    // MARK: - ui components
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .fontWhite
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    private let image = UIImageView(image: ImageLiteral.clothesImage)
    private let timingView: UIView = {
        let view = UIView()
        view.backgroundColor = .dayYellow
        view.layer.cornerRadius = 12
        return view
    }()
    private let timingLabel: UILabel = {
        let label = UILabel()
        label.text = "수면 전"
        label.textColor = .fontWhite
        label.font = .r12
        return label
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "내일 입을 옷 꺼내두기"
        label.textColor = .fontBlack
        label.font = .sb16
        return label
    }()
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "권장 시간 : 3분 30초"
        label.textColor = .fontGray
        label.font = .m14
        return label
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - private func
    
    private func setupLayout() {
        self.addSubview(backView)
        [image, timingView, nameLabel, timeLabel].forEach {
            backView.addSubview($0)
        }
        timingView.addSubview(timingLabel)
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        image.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
        
        timingView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(image.snp.trailing).offset(14)
            $0.width.equalTo(47)
            $0.height.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(timingView.snp.trailing).offset(6)
            $0.centerY.equalTo(timingView.snp.centerY)
        }
        
        timeLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalTo(image.snp.trailing).offset(14)
        }
        
        timingLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
