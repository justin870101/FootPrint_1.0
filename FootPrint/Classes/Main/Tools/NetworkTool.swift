//
//  NetworkTool.swift
//  FootPrint
//
//  Created by Justin on 2018/11/29.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

protocol NetworkToolProtocol {
    static func loadMineData(completion:@escaping (_ sections:[[mineCellModel]])->())
    
    static func loadMyConcernData(completion:@escaping (_ concerns:[myConcernModel])->())
}

extension NetworkToolProtocol{
    static func loadMineData(completion:@escaping (_ sections:[[mineCellModel]])->()){
        let url = BaseURL + "/user/tab/tabs"
        let params = ["device_id":device_id, "iid":iid]
        //var sectionArray = [[mineCellModel]]()
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else{
                return
            }
            if let result = response.result.value{
                let json = JSON(result)
                guard json["message"] == "success" else{
                    //print(json["message"])
                    return
                }
                if let data = json["data"].dictionary{
                    //print(data)
                    if let sections = data["sections"]?.array{
                        var sectionArray = [[mineCellModel]]()
                        sectionArray.append([mineCellModel.deserialize(from: "{\"text\":\"我的关注\",\"grey_text\":\"\"}")!])
                        for sec in sections{
                            var itemArray = [mineCellModel]()
                            for item in sec.arrayObject!{
                                let i = item as! NSDictionary
                                let mcm = mineCellModel.deserialize(from: i)
                                itemArray.append(mcm!)
                            }
                            sectionArray.append(itemArray)
                        }
                        completion(sectionArray)
                        //return sectionArray
                    }
                }
            }
            
        }
        //return sectionArray
    }
    
    static func loadMyConcernData(completion:@escaping (_ concerns:[myConcernModel])->()){
        let url = BaseURL + "/concern/v2/follow/my_follow"
        let params = ["device_id":device_id, "iid":iid]
        //var sectionArray = [[mineCellModel]]()
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else{
                return
            }
            if let result = response.result.value{
                let json = JSON(result)
                guard json["message"] == "success" else{
                    return
                }
                print(json)
                if let datas = json["data"].arrayObject{
                    
                    var concernArray = [myConcernModel]()
                    for data in datas{
                        let concernData = data as! NSDictionary
                        let myConcern = myConcernModel.deserialize(from: concernData)
                        concernArray.append(myConcern!)
                    }
                    completion(concernArray)
                }
            }
            
        }
        //return sectionArray
    }
    
}

struct NetworkTool : NetworkToolProtocol {
    
}
