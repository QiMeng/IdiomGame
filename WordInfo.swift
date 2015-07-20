//
//  WordInfo.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class WordInfo: NSObject {
    
    var idiomId:NSInteger?
    var wordName : NSString?
    var wordImage : UIImage?
    
    init(aIdiomId : NSInteger , aWordName:NSString , aWordImage :UIImage) {
        idiomId = aIdiomId
        wordName = aWordName
        wordImage = aWordImage
    }
}
