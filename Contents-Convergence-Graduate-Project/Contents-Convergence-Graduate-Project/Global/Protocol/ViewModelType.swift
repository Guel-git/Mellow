//
//  ViewModelType.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2024/01/16.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    func transform(from input: Input) -> Output
}
