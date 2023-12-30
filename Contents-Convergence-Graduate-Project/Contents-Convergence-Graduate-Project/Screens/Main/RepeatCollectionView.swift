//
//  RepeatCollectionView.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/12/30.
//

import UIKit

import SnapKit

final class RepeatCollectionView: BaseUIView {
    
    private let weekList = ["월", "화", "수", "목", "금", "토", "일"]
    private enum Size {
        static let collectionHorizontalSpacing: CGFloat = 16
        static let collectionVerticalSpacing: CGFloat = 20
        static let cellSize: CGFloat = 24
        static let collectionInsets = UIEdgeInsets(
            top: collectionVerticalSpacing,
            left: collectionHorizontalSpacing,
            bottom: collectionVerticalSpacing,
            right: collectionHorizontalSpacing)
    }

    // MARK: - property
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = Size.collectionInsets
        flowLayout.itemSize = CGSize(width: Size.cellSize, height: Size.cellSize)
        flowLayout.minimumLineSpacing = 11.6
        return flowLayout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(RepeatCollectionViewCell.self,
                                forCellWithReuseIdentifier: RepeatCollectionViewCell.className)
        return collectionView
    }()
    
    // MARK: - life cycle
    
    override func render() {
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension RepeatCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RepeatCollectionViewCell.className, for: indexPath) as? RepeatCollectionViewCell else {
            assert(false, "Wrong Cell")
            return UICollectionViewCell()
        }
        cell.cellLabel.text = weekList[indexPath.item]
        return cell
    }
}
