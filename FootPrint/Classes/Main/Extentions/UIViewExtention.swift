//
//  UIViewExtention.swift
//  FootPrint
//
//  Created by testin on 2018/12/6.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

protocol RegisterCell {
    
}

extension RegisterCell{
    static var identifier : String{
        return "\(self)"
    }
    static var nib : UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }
}
