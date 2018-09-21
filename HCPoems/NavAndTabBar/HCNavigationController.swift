//
//  HCNavigationViewController.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import UIKit

class HCNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font : UIFont.QXyingbikai(size: 20)]
    }
}
