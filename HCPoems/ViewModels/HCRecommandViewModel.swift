//
//  HCRecommandViewModel.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import UIKit
import RxSwift
struct HCRecommandViewModel: ViewModelType {

    struct Input {
        let page: Observable<Int>
    }
    
    struct Output {
        let poemsList: Observable<[HCPoemModel]>
        
    }

    
    func transform(input: HCRecommandViewModel.Input) -> HCRecommandViewModel.Output {
       let output = input.page.flatMap { (pageNum) -> Observable<[HCPoemModel]> in
            return HCProvider.poemsList(page: pageNum)
        }
        return Output(poemsList: output)
    }
}
