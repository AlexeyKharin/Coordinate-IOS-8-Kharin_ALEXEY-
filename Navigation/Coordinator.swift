
//  Coordinator.swift
//  Navigation
//
//  Created by Alexey Kharin on 22.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.


import Foundation
import UIKit

class Coordinator: NSObject {
    
    @IBOutlet weak var tabBarController: UITabBarController!
    
    private  let postPresenter = PostPresenter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        if let feedNavigationfirst = tabBarController.viewControllers?.first as? UINavigationController, let feedViewController = feedNavigationfirst.viewControllers.first as? FeedViewController {
            feedViewController.output = postPresenter
            postPresenter.navigationController = feedNavigationfirst
        }
        
        if let loginNavigation = tabBarController.viewControllers?[1] as? UINavigationController, let loginController = loginNavigation.viewControllers.last as? LogInViewController {
            let viewPresenter = ViewPresenter(navigationController: loginNavigation)
//            viewPresenter.delegate = LoginInspector.shared
            loginController.outPut = viewPresenter
        }
        
    }
}

