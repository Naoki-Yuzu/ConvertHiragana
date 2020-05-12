//
//  FirstViewController.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: Properties
    private let firstView: FirstView = {
        let view = FirstView()
        view.backgroundColor = .mintCream
        return view
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(firstView)
        firstView.delegate = self
        firstView.addConstraintsToFillView(view)
    }

}

// MARK: - FirstViewDelegate
extension FirstViewController: FirstViewDelegate {
    
    func goToNextView() {
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
}
