






import Foundation

    
struct NetworkManager {
    private static let sharedSession = URLSession.shared
    private static  let session = URLSession.shared
    private static let decoder = JSONDecoder()
    
    static func toObject(json: Data) throws -> Dictionary<String, Any>? {
        return try JSONSerialization.jsonObject(
            with: json,
            options: .mutableContainers
        ) as? [String: Any]
    
    }
    static func dataTask(
        url: URL,
        completion: @escaping (Data?) -> Void
    ) {
        let task = sharedSession.dataTask(
            with: url
        ) { data, response, error in
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse  {
                print(httpResponse.statusCode)
            }
            print(String(data: data!, encoding: .utf8))
            completion(data)
        }
        task.resume()
    }
    
    static func dataTaskJsonDecoder(url: URL, completion: @escaping (Tatooine) -> Void)  {
        
        session.dataTask(
            with: url
        ) {  (data, response, error) in
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            if let parsData = data  {
                if let posts = try? decoder.decode(Tatooine.self, from: parsData) {
                    completion(posts)
                    print(posts)
                }
            }
            
        }.resume()
    }
}

