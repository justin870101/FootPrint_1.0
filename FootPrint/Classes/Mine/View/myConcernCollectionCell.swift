//
//  myConcernCollectionCell.swift
//  FootPrint
//
//  Created by testin on 2018/12/7.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit

class myConcernCollectionCell: UICollectionViewCell, RegisterCell {

    @IBOutlet weak var aevterName: UILabel!
    @IBOutlet weak var aevterImageView: UIImageView!
    var myConcernCollectionData : myConcernModel?{
        didSet{
            aevterName.text = myConcernCollectionData?.name            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
