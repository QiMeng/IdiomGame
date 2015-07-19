//
//  IdiomData.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class IdiomData: NSObject {
   
    var pinyin:String?
    var hanzi:String?
    var jieshi:String?
    var biaoji:String?
    
    
    init(aPinyin:String, aHanzi:String,aJieshi:String, aBiaoji:String ) {
        
        pinyin = aPinyin
        hanzi = aHanzi
        jieshi = aJieshi
        biaoji = aBiaoji

    }
    
    
}
