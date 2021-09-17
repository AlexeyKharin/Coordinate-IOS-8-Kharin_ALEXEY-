







import Foundation
import UIKit
import FirebaseAuth

protocol LoginViewControllerDelegate {
    
    func show()
    
    func typeEmailAndPswd()
    
    func signOut()
    
    var logIn: (() -> Void)? {get set}
    
    var currenUser: User? { get set }
    
    var pswd: String? { get set }
    
    var email: String? { get set }
}

class ViewPresenter: LoginViewControllerDelegate {
    
    var logIn: (() -> Void)?
    
    var currenUser: User?
    
    var pswd: String?
    
    var email: String?
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func typeEmailAndPswd() {

        guard let pswd = pswd else { return }
        guard let email = email else { return }

        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pswd) { (result, error) in
            
            guard error == nil else {
                self.createAccount(email: email, pswd: pswd)
                return
            }
            self.show()
            self.logIn?()
           
        }
    }
    
    private func createAccount(email: String, pswd: String) {
        let alert = UIAlertController(title: "По данноум паролю и логину аккаунт не создан", message: "Хотите создать аккаунт", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel) { (_) in
        }
        let actionContinue = UIAlertAction(title: "Создать", style: .default) { (_) in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: pswd) { (result, error) in
                guard error == nil else {
                    print("Аккаунт не создан")
                    return
                }
                self.currenUser = FirebaseAuth.Auth.auth().currentUser
                print("Успешно")
            }
        }
        
        alert.addAction(actionContinue)
        alert.addAction(actionCancel)
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func signOut() {
        do {
            try  FirebaseAuth.Auth.auth().signOut()
        } catch {
            print("Возникла ошибка")
        }
    }
    
    func show() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}




