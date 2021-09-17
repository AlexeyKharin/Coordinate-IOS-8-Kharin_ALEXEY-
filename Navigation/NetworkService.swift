






import Foundation
import UIKit
struct NetworkService {
    private static let sharedSession = URLSession.shared
    static func dataTask(
        url: URL,
        completion: @escaping (String?) -> Void
    ) {
        let task = sharedSession.dataTask(
            with: url
        ) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            print(httpResponse.statusCode)
            print(httpResponse.allHeaderFields as! [String: Any])
            
            if let data = data {
                completion(String(data: data, encoding: .utf8))
            }
        }
        task.resume()
    }
}


enum AppConfiguration {
    case configOne(URL)
    case configTwo(URL)
    case configThree(URL)
}
