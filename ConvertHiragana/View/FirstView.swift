//
//  FirstView.swift
//  ConvertHiragana
//
//  Created by デュフフくん on 2020/05/12.
//  Copyright © 2020 Naoki-Yuzu. All rights reserved.
//

import UIKit

protocol FirstViewDelegate {
    func goToNextView()
}

class FirstView: UIView {
    
    // MARK: Properties
    private let titleLabel: UILabel = {
        let ul = UILabel()
        ul.font = UIFont.boldSystemFont(ofSize: 30)
        ul.text = "ひらがな化API"
        ul.textAlignment = .center
        return ul
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("始める", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .powderBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(getStrated), for: .touchUpInside)
        return button
    }()
    
    var delegate: FirstViewDelegate?
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Helpers
    func configureUI(){
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, startButton])
        stack.axis = .vertical
        stack.spacing = 200
        self.addSubview(stack)
        stack.center(inView: self)
    }
    
    //MARK: Selectors
    @objc func getStrated() {
        print("hey")
        delegate?.goToNextView()
    }
    
}
