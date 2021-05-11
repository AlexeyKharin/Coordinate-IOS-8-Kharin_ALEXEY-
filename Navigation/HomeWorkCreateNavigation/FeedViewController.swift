//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
import UIKit
final class FeedViewController: UIViewController {
        
    var output: FeedViewOutput?
    
    let post: Post = Post(title: "Пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(type(of: self), #function)
        view.addSubview(stack)
        stack.onTap = { [weak self] in
            guard let self = self else { return }
            self.output?.showPost()
        }
        let constaints = [
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant:300),
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ]
        NSLayoutConstraint.activate(constaints)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(type(of: self), #function)
    }
    
    var stack: ContainerView = {
        let containerView = ContainerView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
}

