//
//  Post.swift
//  Navigation
//
//  Created by Alexey Kharin on 13.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
struct Post: Codable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
//         Позволяет использовать кейс как поля твоей модели  для кодирования
        case userId
        case postId = "id"
        case title
        case body
    }
}
