//
//  HCTabBarViewController.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import UIKit

class HCTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black
        
        let recommandVC = HCRecommandViewController()
        addVCToTabBar(rootVC: recommandVC, vcTitle: "推荐", selectedImg: "recommand_selected", normalImg: "recommand")
        
        let poemsVC = HCPoemsViewController()
        addVCToTabBar(rootVC: poemsVC, vcTitle: "诗文", selectedImg: "poem_selected", normalImg: "poem")
        let findVC = HCFindViewController()
        addVCToTabBar(rootVC: findVC, vcTitle: "发现", selectedImg: "find_selected", normalImg: "find")
        let meVC = HCMeViewController()
        addVCToTabBar(rootVC: meVC, vcTitle: "我", selectedImg: "me_selected", normalImg: "me")

    }
    
    func addVCToTabBar(rootVC: UIViewController, vcTitle: String,selectedImg: String, normalImg: String) {
        rootVC.title = vcTitle
        rootVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.QXyingbikai(size: 14.0)], for: .normal)
        rootVC.tabBarItem.selectedImage = UIImage(named: selectedImg)?.withRenderingMode(.alwaysOriginal)
        rootVC.tabBarItem.image = UIImage(named: normalImg)?.withRenderingMode(.alwaysOriginal)
        let nav = HCNavigationController.init(rootViewController: rootVC)
        addChildViewController(nav)
    }
}
