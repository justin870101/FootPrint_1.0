//
//  mineCustomCell.swift
//  FootPrint
//
//  Created by Justin on 2018/12/5.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class mineCustomCell: UITableViewCell, RegisterCell {

    @IBOutlet weak var mineCellTitle: UILabel!
    @IBOutlet weak var mineCellDesText: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
