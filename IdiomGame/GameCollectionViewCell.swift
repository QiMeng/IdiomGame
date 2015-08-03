//
//  GameCollectionViewCell.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

typealias titleBtnSelectBlock = (awordInfo:WordInfo,selected:Bool)-> ()

class GameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleBtn: UIButton!
    var wordinfo : WordInfo!
    
    var blockTitleBtnClick = titleBtnSelectBlock?()
    
    @IBAction func titleBtnClick(sender: UIButton) {
        
        sender.selected = !sender.selected
        
        if let myblock = self.blockTitleBtnClick
        {
            self.blockTitleBtnClick!(awordInfo: self.wordinfo,selected: sender.selected)
        }
    }
    
    func initTitleClickBlock(mathBlock:titleBtnSelectBlock?)
    {
        self.blockTitleBtnClick = mathBlock;
        
    }
    
    func settitle(awordInfo : WordInfo , arightidiom:Bool)
    {
        self.wordinfo = awordInfo
        self.titleBtn.hidden = false
        self.userInteractionEnabled = true
        self.titleBtn.selected = false
        self.titleBtn.setTitle(awordInfo.wordName, forState:UIControlState.Normal)
        self.titleBtn.setBackgroundImage(UIImage(named: "Btn.png") , forState: UIControlState.Normal)
        self.titleBtn.setBackgroundImage(UIImage(named: "Btn_select.png") , forState: UIControlState.Selected)
    
        self.titleAnimationWithType(arightidiom)
    }
    func titleAnimationWithType(arightidiom:Bool)
    {
        if arightidiom
        {
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                
                var rotationAnimation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                rotationAnimation.toValue = M_PI * 2.0  //NSNumber(float:M_PI * 2.0) //[NSNumber numberWithFloat: M_PI * 2.0 ];
                rotationAnimation.duration = 0
                rotationAnimation.cumulative = true
                rotationAnimation.repeatCount = 1
                self.titleBtn.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
                
            })
        }else
        {
            let translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity , 5 , 0)
            let translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity , -5 , 0)
            
            self.titleBtn.transform = translateLeft;  // starting point
            
            UIView.animateWithDuration(0.07, delay: 0.0, options: .Autoreverse | .Repeat , animations: { () -> Void in
                    UIView.setAnimationRepeatCount(2)
                    self.titleBtn.transform = translateRight
                
                }, completion: { (finsh :Bool) -> Void in
                    if finsh
                    {
                        UIView.animateWithDuration(0.05, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
                                self.titleBtn.transform = CGAffineTransformIdentity
                            }, completion: nil)
                    }
            })
            
        }
    }
    
    func setTitleBtnHiden()
    {
        self.titleBtn.hidden = true
        self.userInteractionEnabled = false
    }
    
}
