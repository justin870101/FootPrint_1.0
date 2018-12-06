//
//  UITableViewExtention.swift
//  FootPrint
//
//  Created by testin on 2018/12/6.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

extension UITableView{

    func fp_registerCell<T:UITableViewCell>(cell:T.Type) where T:RegisterCell {
        let identifier = T.identifier
        let nib = T.nib
        if nib != nil{
            register(nib, forCellReuseIdentifier: identifier)
        }else{
            register(cell, forCellReuseIdentifier: identifier)
        }
    }
    //dequeueReusableCell(withIdentifier: String(describing: myConcertCell.self)) as! myConcertCell
    func fp_dequeueReusableCell<T:UITableViewCell>(cell:T.Type) ->T where T:RegisterCell{
        let identifier = T.identifier
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
    
}
