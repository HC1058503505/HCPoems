//
//  HCProtocolViewModel.swift
//  HCPoems
//
//  Created by cgtn on 2018/9/21.
//  Copyright © 2018年 houcong. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
