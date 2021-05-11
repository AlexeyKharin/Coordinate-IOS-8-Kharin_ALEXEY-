







import Foundation
import UIKit

protocol OutPut {
    
    var delegate: LoginViewControllerDelegate? { get set }
    
    func show()
    
    var pswd: String? { get set }
    
    var login: String? { get set }
}

class ViewPresenter: OutPut {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var delegate: LoginViewControllerDelegate?

    var pswd: String?
    
    var login: String?
    
    func show() {
        guard let safetyPswd = pswd else { return }
        guard let safetyLogin = login else { return }
        guard let delegateSafety = delegate else { return }
        if delegateSafety.checkLogin(login: safetyLogin) && delegateSafety.checkPswd(pswd: safetyPswd) {
            let vc = ProfileViewController()
            navigationController?.pushViewController(vc, animated: true)
        
    }
    }
}

    
  
    
