//
//  IdiomData.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class IdiomInfo: NSObject {
   
    var hanzi:String?
    var jieshi:String?
    var biaoji:String?
    var chengyuId:String?
    override init() {
        
    }
    
    init( aHanzi:String,aJieshi:String, aBiaoji:String,aChengyuId:String ) {
        
        self.hanzi = aHanzi
        self.jieshi = aJieshi
        self.biaoji = aBiaoji
        self.chengyuId = aChengyuId
    }
    
    func idiomdefault() -> IdiomInfo
    {
        return IdiomInfo(aHanzi: "错误成语", aJieshi: "亲你答错了,请再接再厉,要是想不到在规定的时间内你可以点击提示按钮寻求帮助", aBiaoji: "0", aChengyuId: "1")
    }
    
    
}
