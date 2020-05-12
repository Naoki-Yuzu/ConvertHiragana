//
//  MainView.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

// MARK: - Protocols
protocol MainViewDelegate {
    
    func convertToHiragana()
    
    func showAlert()
    
}

class MainView: UIView {
    
    //MARK: - Properties
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "ひらがなに変換できます"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 20)
        tv.textContainer.maximumNumberOfLines = 3
        tv.backgroundColor = .slateGray
        tv.layer.cornerRadius = 10
        tv.text = "文字を入力してください"
        tv.textColor = .white
        return tv
    }()
    
    private lazy var convertButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .powderBlue
        button.setTitle("ひらがなにする", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedConvertButton), for: .touchUpInside)
        return button
    }()
    
    var delegate: MainViewDelegate?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func configureUI() {
        self.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: self.safeAreaLayoutGuide.topAnchor, left: self.safeAreaLayoutGuide.leftAnchor, right: self.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, height: 50)
        self.addSubview(textView)
        textView.delegate = self
        textView.anchor(top: self.descriptionLabel.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor,  right: self.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, height: 100)
        self.addSubview(convertButton)
        convertButton.anchor(top: textView.bottomAnchor, left: self.safeAreaLayoutGuide.leftAnchor, right: self.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, height: 50)
    }
    
    //MARK: - Selectors
    @objc func tappedConvertButton() {
        let trimmingCharatersText = textView.text.trimmingCharacters(in: .whitespaces)
        // 文字が入力されていなかったらエラーを表示させる
        if textView.textColor == .white && textView.text == "文字を入力してください"
        || trimmingCharatersText == "" {
            delegate?.showAlert()
        } else {
            delegate?.convertToHiragana()
        }
    }
    
}

//MARK: - UITextViewDelegate
extension MainView: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.textView.isFirstResponder {
            self.textView.resignFirstResponder()
        }
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.textColor == .white {
            textView.text = nil
            textView.textColor = .black
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.textColor = .white
            textView.text = "文字を入力してください"
        }
    }
    
}
