//
//  GameViewController.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int{
        return 20
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int{
        return 1
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!{
        
        var cell:GameCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("GameCollectionViewCell", forIndexPath: indexPath) as! GameCollectionViewCell

        return cell
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize{
        return CGSizeMake(40, 40)
    }
//    
//    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(2, 2, 2, 2);
//    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!){
        
        NSLog("点击了这个")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
