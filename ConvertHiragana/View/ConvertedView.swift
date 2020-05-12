//
//  ConvertedView.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

protocol ConvertedViewDelegate {
    
    func backToPreviousView()
    
}

class ConvertedView: UIView {
    
    //MARK: - Properties
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "ひらがなに変換しました"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .slateGray
        label.textColor = .white
        label.layer.cornerRadius  = 10
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("戻る", for: .normal)
        button.backgroundColor = .powderBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    var delegate: ConvertedViewDelegate?
    
    var convetedCharacters: String = ""
    
    
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
        self.addSubview(textLabel)
        textLabel.anchor(top: descriptionLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: self.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, height: 150)
        self.addSubview(backButton)
        backButton.anchor(top: textLabel.bottomAnchor, left: safeAreaLayoutGuide.leftAnchor, right: self.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, height: 50)
    }
    
    //MARK: - Selectors
    @objc func tappedBackButton() {
        delegate?.backToPreviousView()
    }
    
}
