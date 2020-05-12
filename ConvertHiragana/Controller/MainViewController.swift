//
//  MainViewController.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    private let mainView: MainView = {
        let view = MainView()
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
        view.addSubview(mainView)
        mainView.delegate = self
        mainView.addConstraintsToFillView(view)
    }
    
    //MARK: - Selectors
    
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
    func convertToHiragana() {
        
    }
    
    func showAlert() {
        let alertController: UIAlertController = UIAlertController(title: "エラー", message: "文字が入力されていません", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
}
