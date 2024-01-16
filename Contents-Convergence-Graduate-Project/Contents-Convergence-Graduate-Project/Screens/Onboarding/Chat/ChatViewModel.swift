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
        let firstButtonTapped: Observable<Void>
        let secondButtonTapped: Observable<Void>
        let thirdButtonTapped: Observable<Void>
    }
    
    struct Output {
        let startViewDelayEnd: Observable<Bool>
        let buttonStackViewDelayEnd: Observable<Bool>
        let selectedButtonText: Observable<String>
        let endViewDelayEnd: Observable<Bool>
        let nextButtonDelayEnd: Observable<Bool>
    }
    
    // MARK: - property
    
    private let buttonTextArray = [TextLiteral.ChatView.firstChatButtonText, TextLiteral.ChatView.secondChatButtonText, TextLiteral.ChatView.thirdChatButtonText]
    
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
        
        let firstButtonText = input.firstButtonTapped
            .withUnretained(self)
            .compactMap { _ in self.buttonTextArray[0] }
        
        let secondButtonText = input.secondButtonTapped
            .withUnretained(self)
            .compactMap { _ in self.buttonTextArray[1] }
        
        let thirdButtonText = input.thirdButtonTapped
            .withUnretained(self)
            .compactMap { _ in self.buttonTextArray[2] }
        
        let selectedButtonText = Observable.merge(
            firstButtonText, secondButtonText, thirdButtonText
        )
        .take(1)
        
        let endViewDelayEnd = Observable.merge(
            firstButtonText, secondButtonText, thirdButtonText
        )
        .take(1)
        .flatMap { _ in
            Observable.create { observer in
                self.delayEndView() {
                    observer.onNext(true)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
        }

        let nextButtonDelayEnd = Observable.merge(
            firstButtonText, secondButtonText, thirdButtonText
        )
        .take(1)
        .flatMap { _ in
            Observable.create { observer in
                self.delayNextButton() {
                    observer.onNext(true)
                    observer.onCompleted()
                }
                return Disposables.create()
            }
        }
        
        return Output(startViewDelayEnd: startViewDelayEnd, buttonStackViewDelayEnd: buttonStackViewDelayEnd, selectedButtonText: selectedButtonText, endViewDelayEnd: endViewDelayEnd, nextButtonDelayEnd: nextButtonDelayEnd)
    }
    
    // MARK: - private func
    
    private func delayStartView(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { completion() }
    }
    
    private func delayButtonStackView(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.5) { completion() }
    }
    
    private func delayEndView(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { completion() }
    }
    
    private func delayNextButton(completion: @escaping() -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { completion() }
    }
}
