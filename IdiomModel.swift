//
//  IdiomModel.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import Foundation

class IdiomModel: RVMViewModel {
    
    var idioms : [IdiomInfo]!
    var words  : [WordInfo]!
    
    var idiomsLoadCommand : RACCommand!
    var wordsLoadCommand: RACCommand!

    private let idiomProtocol: IdiomProtocolForSQL

    
    init(aIdiomProtocol : IdiomProtocolForSQL) {
        
        
        self.idioms = [IdiomInfo]()
        self.words  = [WordInfo]()
        self.idiomProtocol = aIdiomProtocol
        
        super.init()
        

        self.idiomsLoadCommand = RACCommand(signalBlock: { [weak self](anyObject:AnyObject!) -> RACSignal! in
            println("开始下载城市的points")
            return self!.idiomProtocol.randomIdiomForGame()

        })
        
        self.idiomsLoadCommand.executionSignals.subscribeNext { (value:AnyObject!) -> Void in
            var array = value as! NSArray
            print(array)
        }
        
        self.wordsLoadCommand = RACCommand(signalBlock: { [weak self](anyObject:AnyObject!) -> RACSignal! in
            println("开始下载城市的points")
            return self!.idiomProtocol.randomIdiomForGame()
            
        })
        
        
        

        
    }




}
