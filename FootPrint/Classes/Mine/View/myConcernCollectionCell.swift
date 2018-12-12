//
//  myConcernCollectionCell.swift
//  FootPrint
//
//  Created by testin on 2018/12/7.
//  Copyright © 2018年 Justin. All rights reserved.
//

import UIKit
import Kingfisher

class myConcernCollectionCell: UICollectionViewCell, RegisterCell {

    @IBOutlet weak var aevterName: UILabel!
    @IBOutlet weak var aevterImageView: UIImageView!
    @IBOutlet weak var IsVerifyView: UIImageView!
    @IBOutlet weak var tipsButton: UIButton!
    var myConcernCollectionData : myConcernModel?{
        didSet{
            aevterName.text = myConcernCollectionData?.name
            aevterImageView.kf.setImage(with: URL(string: (myConcernCollectionData?.icon)!))
            
            if let IsVerify = myConcernCollectionData?.is_verify{
                IsVerifyView.isHidden = IsVerify
            }
            if let  tips = myConcernCollectionData?.tips{
                tipsButton.isHidden = tips
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tipsButton.layer.borderWidth = 1
        tipsButton.layer.borderColor = UIColor.white.cgColor
    }

}
