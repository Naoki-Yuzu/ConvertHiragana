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
    private let hiraganaAPI = HiraganaAPI()
    
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
    
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
    func convertToHiragana() {
        let willconvertText = mainView.textView.text
        hiraganaAPI.convertToHiragana(sentence: willconvertText!) { convertedText in
            // ひらがなに変換できたら文字を表示する。できなかったら文字は表示せず、変換できなかったことを伝える。
            if convertedText != nil {
                let convertedViewController = ConvertedViewController()
                convertedViewController.convertedView.textView.text = convertedText
                convertedViewController.modalPresentationStyle = .fullScreen
                self.present(convertedViewController, animated: true, completion: nil)
            } else {
                let convertedViewController = ConvertedViewController()
                convertedViewController.convertedView.descriptionLabel.text = "変換できませんでした"
                convertedViewController.modalPresentationStyle = .fullScreen
                self.present(convertedViewController, animated: true, completion: nil)
            }
        }
    }
    
    func showAlert() {
        let alertController: UIAlertController = UIAlertController(title: "エラー", message: "文字が入力されていません", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
