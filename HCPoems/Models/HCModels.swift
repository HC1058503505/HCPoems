//
//  HCModels.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import Foundation

struct HCPoemExtension: Codable {
    let extension_good:String
    let extension_bad:String
    let extension_title:String
    let extension_content:String
}

struct HCPoemModel: Codable {
    let _id:String
    let poem_id:String
    let poem_content:String
    let poem_extension:[HCPoemExtension]
    let poem_dynasty:String
    let poem_praise_count:String
    let poem_title:String
    let poem_author:String
    let poem_tags:[String]
}


