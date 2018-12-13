//
//  MineViewController.swift
//  FootPrint
//
//  Created by Justin on 2018/11/22.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit
class MineViewController: UITableViewController {

    var cellData = [[mineCellModel]]()
    var concernData = [myConcernModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.yellow
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.setBackgroundColor()
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
        tableView.tableHeaderView = headerView
        tableView.fp_registerCell(cell: mineCustomCell.self)
        tableView.fp_registerCell(cell: myConcernCell.self)
  
        NetworkTool.loadMineData{ cellData in
            self.cellData = cellData
            
            NetworkTool.loadMyConcernData{ concernData in
                self.concernData = concernData
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            }
            
            self.tableView.reloadData()
        }   
    }
    
    fileprivate lazy var headerView:noLoginView = noLoginView.headerView()
    
//   fileprivate lazy var headerView:noLoginView = {
//        let headerView = noLoginView.headerView()
//        return headerView
//    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        if offSetY < 0{
            let totleOffSet = CGFloat(280) + abs(offSetY)
            let f = totleOffSet / CGFloat(280)
            headerView.backgroundImage.frame = CGRect(x: -screenWidth * (f-1), y: offSetY, width: screenWidth*f, height: totleOffSet)
        }
    }
    
}

extension MineViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0 && indexPath.row == 0){
            return (concernData.count == 0 || concernData.count == 1) ? 40 : 114
        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.setBackgroundColor()
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if(indexPath.section == 0 && indexPath.row == 0)
        {

            let cell = tableView.fp_dequeueReusableCell(cell: myConcernCell.self) as myConcernCell
            cell.mineCellModel = cellData[indexPath.section][indexPath.row]
            
//            cell.mineCellTitle.text = cellData[indexPath.section][indexPath.row].text
//            cell.mineCellDesText.text = cellData[indexPath.section][indexPath.row].grey_text
            
            
            if(concernData.count == 0 || concernData.count == 1){
                cell.concernPersonList.isHidden = true
            }
            if(concernData.count == 1){
                cell.myConcernCollection = concernData[0]
            }
            else if(concernData.count > 1){
                cell.myConcernCollections = concernData
            }
            return cell
        }

        
        let cell = tableView.fp_dequeueReusableCell(cell: mineCustomCell.self) as mineCustomCell
        cell.mineCellTitle.text = cellData[indexPath.section][indexPath.row].text
        cell.mineCellDesText.text = cellData[indexPath.section][indexPath.row].grey_text
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
