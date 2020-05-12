//
//  ConvertedViewController.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

class ConvertedViewController: UIViewController{
    
    //MARK: - Properties
    let convertedView: ConvertedView = {
        let view = ConvertedView()
        view.backgroundColor = .mintCream
        return view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Helpers
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(convertedView)
        convertedView.delegate = self
        convertedView.addConstraintsToFillView(view)
    }
    
}

// MARK: - ConvertedViewDelegate
extension  ConvertedViewController: ConvertedViewDelegate {
    
    func backToPreviousView() {
        dismiss(animated: true, completion: nil)
    }
    
}
