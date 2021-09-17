//
//  ImageContent+CoreDataProperties.swift
//  
//
//  Created by Alexey Kharin on 18.07.2021.
//
//

import Foundation
import CoreData


extension ImageContent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageContent> {
        return NSFetchRequest<ImageContent>(entityName: "ImageContent")
    }

    @NSManaged public var image: String?
    @NSManaged public var likes: String?
    @NSManaged public var views: String?
    @NSManaged public var discreption: String?
    @NSManaged public var title: String?

}
