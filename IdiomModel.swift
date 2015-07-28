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
    var sameWords : Dictionary<String, [String]>!
    dynamic var selectWords : [WordInfo]!
    var idiomsLoadCommand : RACCommand!
    var wordsLoadCommand: RACCommand!
    var judgeIdiomCommand: RACCommand!
    
    private let idiomProtocol: IdiomProtocolForSQL

    
    init(aIdiomProtocol : IdiomProtocolForSQL) {
        
        
        self.idioms = [IdiomInfo]()
        self.words  = [WordInfo]()
        self.sameWords = [:]
        self.selectWords = [WordInfo]()
        self.idiomProtocol = aIdiomProtocol
        
        super.init()
        

        self.idiomsLoadCommand = RACCommand(signalBlock: { [weak self](anyObject:AnyObject!) -> RACSignal! in
            return self!.idiomProtocol.randomIdiomForGame()

        })
        
        self.idiomsLoadCommand.executionSignals.subscribeNext { [weak self](value:AnyObject!) -> Void in
            
            let idiomsLoadSignal = value as! RACSignal
            idiomsLoadSignal.subscribeNext({ (value2 :AnyObject!) -> Void in
                var array = value2 as! [IdiomInfo]
                
                self!.idioms = array
                self!.wordsLoadCommand.execute(nil)
                
            })
        }

        
        self.judgeIdiomCommand = RACCommand(signalBlock: {[weak self](anyobjec:AnyObject!) -> RACSignal! in
            
            return RACSignal.createSignal({ (subscriber : RACSubscriber!) -> RACDisposable! in
               
                let judgeInfo = self!.judgeSelectedIdiom()
                if(judgeInfo.rightIdiom)
                {
                    var mtbwords = NSMutableArray(array: self!.words)
                    for myselect in self!.selectWords
                    {
                        let myindex = mtbwords.indexOfObject(myselect)
                        self!.words.removeAtIndex(myindex)
                        mtbwords.removeObject(myselect)
                    }
                   
                }
                self!.selectWords.removeAll(keepCapacity: true)
                subscriber.sendNext(judgeInfo.idiom)
                subscriber.sendCompleted()
                
                return nil
            })
        })
        
        self.wordsLoadCommand = RACCommand(signalBlock: { [weak self](anyObject:AnyObject!) -> RACSignal! in
            
            self!.wordsSet(self!.idioms)
            
            return RACSignal.empty()
            
        })
        
        RACObserve(self,"selectWords").distinctUntilChanged().filter { (value:AnyObject!) -> Bool in
            
            return value.count >= 4
            
        }.subscribeNext {
            [weak self] (next: AnyObject!) -> ()  in
            self!.judgeIdiomCommand.execute(nil)
            
            NSLog("已经选中4个字了")
        }

        
    }
    
    func wordsSet(aidioms : NSArray)
    {
        var wordsforSame : NSMutableArray = []
        for aidiom in aidioms
        {
            let idiom = aidiom as! IdiomInfo
            let wordstr = idiom.hanzi as String?
            let wordstrs = wordstr!.componentsSeparatedByString(" ")

            for aword in wordstrs
            {
                if(wordsforSame.containsObject(aword))
                {
                    var idiomIds :[String] = []
                    if let name = self.sameWords
                    {
                        if let same = self.sameWords[aword]
                        {
                            idiomIds = self.sameWords[aword]!
                        }else
                        {
                            let indexid = self.getChengYuIdFromWords(self.words, awordName: aword)
                            idiomIds.append(indexid)
                        }
                    }else
                    {
                        let indexid = self.getChengYuIdFromWords(self.words, awordName: aword)
                        idiomIds.append(indexid)
                    }
                    idiomIds.append(String(idiom.chengyuId!))
                    self.sameWords.updateValue(idiomIds, forKey: aword)
                }
                
                let word = WordInfo(aIdiomId: idiom.chengyuId! , aWordName: aword, aWordImageName: "image")
                var randIndex = 0
                if(self.words.count > 1)
                {
                    randIndex = random() % (self.words.count - 1)
                }
                self.words.insert(word, atIndex: randIndex)
                
                wordsforSame.addObject(aword)
                
            }
        }
    }
    
    func getChengYuIdFromWords(awordinfo:[WordInfo] , awordName: String) -> String
    {
        var changyuId : String = ""
        for(var i = 0 ; i < awordinfo.count ; i++)
        {
            let mywordinfo = awordinfo[i]
            if(mywordinfo.wordName! == awordName)
            {
                changyuId = awordinfo[i].idiomId!
                break;
            }
        }
        return changyuId
    }
    func addOrRemoveWordToSelectedWords(awordInfo:WordInfo,isAdd:Bool)
    {
        if(isAdd)
        {
            self.selectWords.append(awordInfo)
        }else
        {
            var  wordIndex = 0
            for (var aindex = 0 ; aindex < self.selectWords.count ; aindex++)
            {
                if(self.selectWords[aindex].isEqual(awordInfo))
                {
                    wordIndex = aindex
                    break
                }
            }
            self.selectWords.removeAtIndex(wordIndex)
        }
    }
    
    func judgeSelectedIdiom() -> (rightIdiom:Bool,idiom:IdiomInfo)
    {
        var currentIdiomids : NSMutableArray = NSMutableArray()
        
        for word in self.selectWords
        {
            let name = word.wordName
            currentIdiomids.addObject(word.wordName!)
        }
        var idiomIndex = 0
        for idiom in self.idioms
        {
            let idiomStr = idiom.hanzi
            let idiomStrs = idiom.hanzi!.componentsSeparatedByString(" ")
            var  rightIdiom = true
            for word in idiomStrs
            {
                if !currentIdiomids.containsObject(word)
                {
                    rightIdiom = false
                    break
                }
            }
            if rightIdiom
            {
                self.idiomProtocol.updateIdiomWithBiaoji("1",achenyuId: idiom.chengyuId!)
                self.idioms.removeAtIndex(idiomIndex)
                return(rightIdiom,idiom)
            }
            
            idiomIndex++
        }
        return(false,IdiomInfo.init().idiomdefault())

    }
}
