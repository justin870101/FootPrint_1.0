//
//  FPTabBarController.swift
//  FootPrint
//
//  Created by Justin on 2018/11/22.
//  Copyright © 2018 Justin. All rights reserved.
//

import UIKit

class FPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor.purple
        addChildViewControllers()
        // Do any additional setup after loading the view.
    }
    
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: HomeViewController(), title: "首页", imageName: "home_tabbar_32x32_")
        addChildViewController(childController: FootPrintViewController(), title: "足迹", imageName: "huoshan_tabbar_32x32_")
        addChildViewController(childController: MineViewController(), title: "我的", imageName: "mine_tabbar_32x32_")
        //addChildViewController(childController: YMMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    
    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        childController.title = title
        let navC = FPNavigationController(rootViewController: childController)
        addChild(navC)
    }

}
