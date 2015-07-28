//
//  IdiomProtocolForSQL.swift
//  IdiomGame
//
//  Created by Lin on 15/7/20.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

//import UIKit
import Foundation

class IdiomProtocolForSQL: NSObject , IdiomProtocol {
    
    func openDB() -> FMDatabase{

        let filemgr = NSFileManager.defaultManager()
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = dirPaths[0] as! String
        var databasePath = docsDir.stringByAppendingPathComponent("idioms.db")
        if !filemgr.fileExistsAtPath(databasePath) {

            let path = NSBundle.mainBundle().pathForResource("idioms", ofType: "db")
            filemgr.copyItemAtPath(path!, toPath: databasePath, error: nil)
        }
        
        let feedlogDb = FMDatabase(path: databasePath)
        if(!feedlogDb.open())
        {
           NSLog("Could not open map.sqlite.");
           abort()
        }
        return feedlogDb
        
    }
    
    func randomIdiomForGame() -> RACSignal {
        
        return RACSignal.createSignal({ (subscriber: RACSubscriber!) -> RACDisposable! in
            
            var idioms = [IdiomInfo]()
            let db = self.openDB()
            let rs = db.executeQuery("select * from idioms where biaoji = '0' limit 9", withArgumentsInArray:nil)
            while(rs.next()){

                let idiom = self.changetoIdiom(rs)
                idioms.append(idiom)
                
            }
            
            rs.close()
            db.close()
            
            subscriber.sendNext(idioms)
            subscriber.sendCompleted()
            
            return RACDisposable(block: {

            })

        }).deliverOn(RACScheduler.mainThreadScheduler())
    }
    
    func updateIdiomWithBiaoji(abiaoji:String,achenyuId:String)
    {
        let db = self.openDB()
        
        let sql = "UPDATE idioms SET biaoji=? WHERE chengyuId=?"
        let rsUpdate = db.executeUpdate(sql, withArgumentsInArray: [abiaoji,achenyuId])
        if rsUpdate
        {
            println("修改成功")
        }else
        {
            println("修改失败")
        }
        db.close()

    }
    
    func promptIdioms() -> [IdiomInfo]
    {
        var promptIdioms = [IdiomInfo]()
        
        let db = self.openDB()
        let rs = db.executeQuery("select * from idioms where biaoji = 2", withArgumentsInArray:nil)
        while(rs.next()){

            let idiom = self.changetoIdiom(rs)
            promptIdioms.append(idiom)
            
        }
        
        return promptIdioms
    }
    
    func changetoIdiom(rs :FMResultSet)->IdiomInfo
    {
        let chengyuId = rs.stringForColumn("chengyuId")
        let hanzi = rs.stringForColumn("hanzi")
        let jieshi = rs.stringForColumn("jieshi")
        let biaoji = rs.stringForColumn("biaoji")
        let idiom = IdiomInfo(aHanzi: hanzi, aJieshi: jieshi, aBiaoji: biaoji, aChengyuId: chengyuId)
        return idiom
    }
    
    
}
