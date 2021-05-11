//
//  ViewModuleTable.swift
//  Navigation
//
//  Created by Alexey Kharin on 23.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit
protocol OutPutModule {
    var strotage: [PostContent] { fet set }
}
class ViewModuleTable: OutPutModule {

    var strotage:[PostContent] = Strotage.collection
  
}




