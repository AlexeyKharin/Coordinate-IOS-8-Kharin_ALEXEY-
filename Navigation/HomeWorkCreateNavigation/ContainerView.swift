//
//  ContainerView.swift
//  Navigation
//
//  Created by Alexey Kharin on 21.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit
class ContainerView: UIStackView {
    
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(buyButton)
        addArrangedSubview(buyButtonTwo)
        spacing = 10
        axis = .vertical
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        return button
    }()
    
    lazy var buyButtonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        return button
    }()
    
    @objc private func press() {
        onTap?()
    }
}


