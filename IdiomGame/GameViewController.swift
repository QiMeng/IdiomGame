//
//  GameViewController.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var titleforIdiom: UILabel!
    @IBOutlet var explainForIdiom: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    
    let ALLCELLS = 36
    dynamic var viewModel: IdiomModel!
    dynamic var idiomProtocolSQL: IdiomProtocolForSQL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idiomProtocolSQL = IdiomProtocolForSQL.new()
        
        self.viewModel = IdiomModel(aIdiomProtocol: self.idiomProtocolSQL)
        self.viewModel.idiomsLoadCommand.execute(nil)
        
        self.viewModel.wordsLoadCommand.executionSignals.subscribeNext { (value :AnyObject!) -> Void in
            self.collectionview.reloadData()
        }
        
        
        self.viewModel.judgeIdiomCommand.executionSignals.subscribeNext { (value :AnyObject!) -> Void in
            let idiomsLoadSignal = value as! RACSignal
            
            idiomsLoadSignal.subscribeNext({ (value2 :AnyObject!) -> Void in
                
                let idiom = value2 as! IdiomInfo
                self.titleforIdiom.text = idiom.hanzi
                self.explainForIdiom.text = idiom.jieshi
           
            })
            self.collectionview.reloadData()
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func backHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    @IBAction func promptIdiom(sender: UIButton) {
        //提示
        if self.viewModel.idioms.count > 0
        {
            let promptIdiom = self.viewModel.idioms[0]
            self.titleforIdiom.text = "提示：" + promptIdiom.hanzi!
            self.explainForIdiom.text = promptIdiom.jieshi
            
            //提示的成语要在数据库中标记
            self.idiomProtocolSQL.updateIdiomWithBiaoji("2", achenyuId: promptIdiom.chengyuId!)
        }
        
    }
    @IBAction func musicSwitch(sender: UIButton) {
        //音乐开关
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int{
        return ALLCELLS
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int{
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!{
        
        var cell:GameCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GameCollectionViewCell", forIndexPath: indexPath) as! GameCollectionViewCell
        
        if(indexPath.row < ALLCELLS - self.viewModel.words.count)
        {
            cell.setTitleBtnHiden()
        }else
        {
            let wordIndex = indexPath.row - (ALLCELLS - self.viewModel.words.count)
            cell.settitle(self.viewModel.words[wordIndex])
            
            cell.initTitleClickBlock({[weak self] (awordInfo, selected) -> () in

                self!.viewModel.addOrRemoveWordToSelectedWords(awordInfo, isAdd: selected)
                
            })
        }
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
//        return CGSizeMake(40, 40)
//    }
    
    
//    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!){
//        
//        NSLog("~~点击了这个")
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
