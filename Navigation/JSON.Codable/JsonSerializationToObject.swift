//
//  JsonSerializationToObject.swift
//  Navigation
//
//  Created by Alexey Kharin on 13.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class JsonSerializationToObject {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
    
    init(userId: Int,  id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.completed = completed
        self.title = title
        self.id = id
    }
}
