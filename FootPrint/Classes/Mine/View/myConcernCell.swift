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
    @IBOutlet weak var concernPersonList: UICollectionView!    
    
    var myConcernCollections = [myConcernModel](){
        didSet{
            concernPersonList.reloadData()
        }
    }
    
    var myConcernCollection : myConcernModel?{
        didSet{
            
        }
    }
    var mineCellModel:mineCellModel?{
        didSet{
            mineCellTitle.text = mineCellModel?.text
            mineCellDesText.text = mineCellModel?.grey_text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        concernPersonList.collectionViewLayout = myConcernFlowLayout()
        concernPersonList.delegate = self as UICollectionViewDelegate
        concernPersonList.dataSource = self as UICollectionViewDataSource
        
        concernPersonList.fp_registerCell(cell: myConcernCollectionCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension myConcernCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.fp_dequeueReusableCell(indexPath: indexPath) as myConcernCollectionCell
        cell.myConcernCollectionData = myConcernCollections[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcernCollections.count
    }

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
