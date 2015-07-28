//
//  IdiomProtocol.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import Foundation

protocol IdiomProtocol {
    func randomIdiomForGame() -> RACSignal
    func updateIdiomWithBiaoji(abiaoji:String,achenyuId:String)
    func promptIdioms() -> [IdiomInfo]
}
