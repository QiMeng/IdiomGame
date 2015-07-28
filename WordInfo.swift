//
//  WordInfo.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class WordInfo: NSObject {
    
    var idiomId:String?
    var wordName : String?
    var wordImageName : String?
    
    init(aIdiomId : String , aWordName:String , aWordImageName :String) {
        self.idiomId = aIdiomId
        self.wordName = aWordName
        self.wordImageName = aWordImageName
    }
    
}
