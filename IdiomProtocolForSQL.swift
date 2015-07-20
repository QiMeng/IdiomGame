//
//  IdiomProtocolForSQL.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class IdiomProtocolForSQL: NSObject , IdiomProtocol {
    
    func randomIdiomForGame() -> RACSignal {
        
        return RACSignal.createSignal({ (subscriber: RACSubscriber!) -> RACDisposable! in
            
            let info = ["狼心狗肺","善尽天良","恩将仇报"]
            subscriber.sendNext(info)
            subscriber.sendCompleted()
            
            return RACDisposable(block: {
//                task.cancel()
            })
//
        }).deliverOn(RACScheduler.mainThreadScheduler())
    }
}
