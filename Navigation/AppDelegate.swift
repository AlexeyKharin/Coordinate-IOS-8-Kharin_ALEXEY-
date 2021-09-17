
import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var arrayUrl: [AppConfiguration] = [
        .configOne(URL(string:"https://swapi.dev/api/people/8")!),
        .configTwo(URL(string:"https://swapi.dev/api/starships/3")!),
        .configThree(URL(string:"https://swapi.dev/api/planets/5")!)
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let appConfiguration: AppConfiguration = arrayUrl.randomElement()!
        
        switch appConfiguration {
        case .configOne(let urlOne):
            NetworkService.dataTask(url: urlOne) { (data) in
                print(data ?? "Данных нет")
            }
            
        case .configTwo(let urlTwo):
            NetworkService.dataTask(url: urlTwo) { (data) in
                print(data ?? "Данных нет")
            }
        case .configThree(let urlThree):
            NetworkService.dataTask(url: urlThree) { (data) in
                print(data ?? "Данных нет")
            }   
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

