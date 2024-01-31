//
//  ResultViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/31.
//

import UIKit

import RxSwift

final class ResultViewModel: ViewModelType {
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }
 
    struct Output {
        let titleText: Observable<String>
        let emojiImage: Observable<UIImage>
        let angelText: Observable<String>
        let favoriteText: Observable<String>
        let contentText: Observable<String>
        let routineTableViewHeight: Observable<Int>
        let routineBeforeImage: Observable<[UIImage]>
        let routineAfterImage: Observable<[UIImage]>
        let routineBeforeText: Observable<[String]>
        let routineAfterText: Observable<[String]>
    }
    
    // MARK: - property
    
    let resultType: SleepType
    
    // MARK: - init
    
    init(resultType: SleepType) {
        self.resultType = resultType
    }
    
    func transform(from input: Input) -> Output {
        let titleText = input.viewDidLoad
            .map { _ in self.resultType.typeText }
        
        let emojiImage = input.viewDidLoad
            .map { _ in self.resultType.typeImage }
        
        let angelText = input.viewDidLoad
            .map { _ in self.resultType.angelText }
        
        let favoriteText = input.viewDidLoad
            .map { _ in self.resultType.favoriteText }
        
        let contentText = input.viewDidLoad
            .map { _ in self.resultType.contentText }
        
        let routineTableViewHeight = input.viewDidLoad
            .map { _ in self.resultType.routineTableViewHeight }
        
        let routineBeforeImage = input.viewDidLoad
            .map { _ in self.resultType.routineBeforeImage }
        
        let routineAfterImage = input.viewDidLoad
            .map { _ in self.resultType.routineAfterImage }
        
        let routineBeforeText = input.viewDidLoad
            .map { _ in self.resultType.routineBeforeArray }
        
        let routineAfterText = input.viewDidLoad
            .map { _ in self.resultType.routineAfterArray }
        
        return Output(titleText: titleText, emojiImage: emojiImage, angelText: angelText, favoriteText: favoriteText, contentText: contentText, routineTableViewHeight: routineTableViewHeight, routineBeforeImage: routineBeforeImage, routineAfterImage: routineAfterImage, routineBeforeText: routineBeforeText, routineAfterText: routineAfterText)
    }
}
