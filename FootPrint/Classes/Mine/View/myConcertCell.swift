//
//  myConcertCell.swift
//  FootPrint
//
//  Created by testin on 2018/12/6.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

class myConcertCell: UITableViewCell,RegisterCell {

    @IBOutlet weak var mineCellTitle: UILabel!
    @IBOutlet weak var mineCellDesText: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var concertPersonList: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
