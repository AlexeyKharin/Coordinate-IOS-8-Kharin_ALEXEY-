//
//  ViewVodule.swift
//  Navigation
//
//  Created by Alexey Kharin on 24.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class ViewModule {
    
    var inPutModel: InPutModel? {
        didSet {
            inPutModel?.closure = { indexPath in return
            Strotage.collection[indexPath.section].imageContent[indexPath.row]
        }
        
    }
}
}
