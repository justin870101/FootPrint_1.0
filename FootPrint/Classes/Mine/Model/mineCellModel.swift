//
//  mineCellModel.swift
//  FootPrint
//
//  Created by Justin on 2018/11/30.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit
import HandyJSON

struct mineCellModel :HandyJSON {
    var text :String = ""
    var grey_text : String = ""
}

struct myConcernModel :HandyJSON {
    var name : String?
    var icon : String?
    var description: String?
    var type : String?
}
