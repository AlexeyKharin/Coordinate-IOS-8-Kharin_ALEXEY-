//
//  ImageTransformer.swift
//  Navigation
//
//  Created by Alexey Kharin on 19.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ImageTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        let data = image.pngData()
        return data
    }
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let imageData = value as? Data else { return nil }
        return UIImage(data: imageData)
    }
}
