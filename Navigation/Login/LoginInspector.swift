//
//  LoginInspector.swift
//  Navigation
//
//  Created by Alexey Kharin on 21.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate {
    
    func checkLogin(login: String) -> Bool
    
    func checkPswd(pswd: String) -> Bool
    
}

class LoginInspector: LoginViewControllerDelegate {
    
    var login: String
    
    var pswd: String
    
    public static let shared: LoginInspector = .init()
    
    private init() {
        self.login = "Z"
        self.pswd = "Z"
        
    }
    
    func checkLogin(login: String) -> Bool {
        if login == self.login {
            return true
        } else {
            return false
        }
    }
    
    func checkPswd(pswd: String) -> Bool {
        if pswd == self.pswd {
            return true
        } else {
            return false
        }
    }
    
    
}
