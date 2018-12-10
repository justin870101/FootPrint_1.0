//
//  UICollectionViewExtention.swift
//  FootPrint
//
//  Created by testin on 2018/12/6.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

extension UICollectionView{
    
    func fp_registerCell<T:UICollectionViewCell>(cell:T.Type) where T:RegisterCell {
        let identifier = T.identifier
        let nib = T.nib
        if nib != nil{
            register(nib, forCellWithReuseIdentifier: identifier)
        }else{
            register(cell, forCellWithReuseIdentifier: identifier)
        }
    }

    func fp_dequeueReusableCell<T:UICollectionViewCell>(indexPath:IndexPath) ->T where T:RegisterCell{
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
    
}
