//
//  BaseViewController.swift
//  Contents-Convergence-Graduate-Project
//
//  Created by 김유나 on 2023/10/26.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - init

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    deinit {
        print("success deallocation")
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
        configUI()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func render() {
        // Override Layout
    }

    func configUI() {
        view.backgroundColor = .white
    }
}
