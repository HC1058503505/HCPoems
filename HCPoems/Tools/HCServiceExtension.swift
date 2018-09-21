//
//  HCServiceExtension.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import Foundation
import Moya

extension HCService: TargetType {
    var baseURL: URL {
        return URL(string: Constant.baseURL)!
    }
    
    var path: String {
        switch self {
        case .poemsList(let page):
            return "/poems/\(page)"
        }
        
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .poemsList(let page):
            return "\"page\": \(page)".utf8Encoded
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}




private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
