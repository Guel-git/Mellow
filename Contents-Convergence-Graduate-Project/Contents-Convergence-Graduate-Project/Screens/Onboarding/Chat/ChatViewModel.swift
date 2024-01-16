//
//  ChatViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/16.
//

import UIKit

import RxSwift

final class ChatViewModel: ViewModelType {
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    struct Output {
        let startViewDelayEnd: Observable<Bool>
        let buttonStackViewDelayEnd: Observable<Bool>
    }
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        let startViewDelayEnd = input.viewDidLoad
            .withUnretained(self)
            .flatMap { _ in
                Observable.create { observer in
                    self.delayStartView() {
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
            }
        
        let buttonStackViewDelayEnd = input.viewDidLoad
            .withUnretained(self)
            .flatMap { _ in
                Observable.create { observer in
                    self.delayButtonStackView() {
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                    return Disposables.create()
                }
            }
        
        return Output(startViewDelayEnd: startViewDelayEnd, buttonStackViewDelayEnd: buttonStackViewDelayEnd)
    }
    
    // MARK: - private func
    
    private func delayStartView(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            completion()
        }
    }
    
    private func delayButtonStackView(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) {
            completion()
        }
    }
}
