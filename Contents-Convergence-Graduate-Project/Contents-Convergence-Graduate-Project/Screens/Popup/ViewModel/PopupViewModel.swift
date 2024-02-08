//
//  PopupViewModel.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/02/08.
//

import UIKit

import RxSwift

final class PopupViewModel: ViewModelType {
    
    struct Input {
        let viewDidLoad: Observable<Void>
    }
    
    struct Output { }
    
    // MARK: - public func
    
    func transform(from input: Input) -> Output {
        
        _ = input.viewDidLoad
            .withUnretained(self)
            .subscribe { _ in self.showNotification() }
        
        return Output()
    }
    
    // MARK: - private func
    
    private func showNotification() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            NotificationManager.shared.requestPermission()
        }
    }
}
