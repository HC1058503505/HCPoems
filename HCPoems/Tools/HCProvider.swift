//
//  HCProvider.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import Foundation

import Moya
import RxSwift

enum HCError: Error {
    case urlNotExist
    case dataFormatWrong
    case failedConnectServer
}

struct HCProvider {
    fileprivate static let HttpProvider = MoyaProvider<HCService>()
    static func poemsList(page: Int) -> Observable<[HCPoemModel]> {
       return HttpProvider.rx.request(HCService.poemsList(page: page)).asObservable().mapJSON(failsOnEmptyData: true)
            .flatMap { (json) -> Observable<[HCPoemModel]> in

                guard let poems = json as? [[String : Any]] else {
                    return Observable<[HCPoemModel]>.error(HCError.dataFormatWrong)
                }
            

                var poemsList = [HCPoemModel]()
                for poem in poems {
                    do {
                        guard let data = try? JSONSerialization.data(withJSONObject: poem, options: []) else {
                            continue
                        }
                        
                        guard let poem = try? JSONDecoder().decode(HCPoemModel.self, from: data) else {
                            continue
                        }
                        poemsList.append(poem)
                    }

                }
                return Observable<[HCPoemModel]>.create({ (poems) -> Disposable in
                    poems.onNext(poemsList)
                    return Disposables.create()
                })
                
        }
    }
        
        
}
