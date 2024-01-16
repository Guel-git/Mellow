//
//  UIViewController+Rx.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/16.
//

import UIKit

import RxSwift

public extension Reactive where Base: UIViewController {
    var viewDidLoad: Observable<Void> {
        return Observable.just(())
    }
    
    var viewWillAppear: Observable<Void> {
        return self.methodInvoked(#selector(Base.viewWillAppear)).map { _ in }
    }
    
    var viewDidAppear: Observable<Void> {
        return self.methodInvoked(#selector(Base.viewDidAppear)).map { _ in }
    }
    
    var viewWillDisappear: Observable<Void> {
        return self.methodInvoked(#selector(Base.viewWillDisappear)).map { _ in }
    }
    
    var viewDidDisappear: Observable<Void> {
        return self.methodInvoked(#selector(Base.viewDidDisappear)).map { _ in }
    }
}

