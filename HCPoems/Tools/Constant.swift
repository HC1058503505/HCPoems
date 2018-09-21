//
//  Constant.swift
//  HCRxSwift
//
//  Created by cgtn on 2018/6/28.
//  Copyright © 2018年 cgtn. All rights reserved.
//

import Foundation
import UIKit

public struct Constant {
   static let baseURL = "http://180.76.181.15:3000"
   static let kListWidth:CGFloat = 120.0
   static let kScreenWidth = UIScreen.main.bounds.width
   static let kScreenHeight = UIScreen.main.bounds.height
    
   static let kThemeColor = UIColor(red: 230.0 / 255.0, green: 88.0 / 255.0, blue: 83.0 / 255.0, alpha: 1.0)
    
   static let kThemeLightGrayColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    
   static let kNavgiationTabBarH = CGFloat(44.0)
    
   static let placeholderImg = UIImage(named: "placeholder")
}

extension UIFont {
    static func QXyingbikai(size: CGFloat) -> UIFont {
        return UIFont(name: "QXyingbikai", size: size) ?? UIFont.systemFont(ofSize:size)
    }
}


