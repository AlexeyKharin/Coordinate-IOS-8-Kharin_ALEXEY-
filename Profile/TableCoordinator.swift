//
//  TableCoordinator.swift
//  Navigation
//
//  Created by Alexey Kharin on 23.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit
class TableCoordinator {
    var navigationController: UINavigationController?
    
    let viewModuleTable = ViewModuleTable()
    
    let profileViewController = ProfileViewController()
    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
    func setUp() {
        profileViewController.viewModuleTable = viewModuleTable
//    }
}
}
