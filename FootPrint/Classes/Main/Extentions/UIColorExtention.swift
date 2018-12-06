//
//  UIColorExtention.swift
//  FootPrint
//
//  Created by Justin on 2018/11/28.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat = 1.0) {
        self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class func setBackgroundColor() -> UIColor{
        return UIColor(displayP3Red: 235 / 255.0, green: 235 / 255.0, blue: 235 / 255.0, alpha: 1.0)
    }
}
