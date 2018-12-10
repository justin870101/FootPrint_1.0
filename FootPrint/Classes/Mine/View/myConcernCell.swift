//
//  myConcertCell.swift
//  FootPrint
//
//  Created by testin on 2018/12/6.
//  Copyright © 2018年 zm. All rights reserved.
//

import UIKit

class myConcernCell: UITableViewCell,RegisterCell {

    @IBOutlet weak var mineCellTitle: UILabel!
    @IBOutlet weak var mineCellDesText: UILabel!
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var concertPersonList: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        concertPersonList.collectionViewLayout = myConcernFlowLayout()
        concertPersonList.delegate = self
        concertPersonList.dataSource = self
        
        concertPersonList.fp_registerCell(cell: myConcernCollectionCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class myConcernFlowLayout : UICollectionViewFlowLayout{
        override func prepare() {
            itemSize = CGSize(width: 58, height: 74)
            minimumLineSpacing = 0
            minimumInteritemSpacing = 0
            sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            scrollDirection = .horizontal
        }
    }
    

    
}
