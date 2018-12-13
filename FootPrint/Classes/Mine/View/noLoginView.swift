//
//  noLoginView.swift
//  FootPrint
//
//  Created by testin on 2018/12/13.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
//import IBAnimatable

class noLoginView: UIView {

    @IBOutlet weak var backgroundImage: UIImageView!
    class func headerView() -> noLoginView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! noLoginView
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }

    */

}
