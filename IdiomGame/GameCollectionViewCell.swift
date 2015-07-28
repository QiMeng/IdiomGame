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
    
    func settitle(awordInfo : WordInfo)
    {
        self.wordinfo = awordInfo
        self.titleBtn.hidden = false
        self.userInteractionEnabled = true
        self.titleBtn.selected = false
        self.titleBtn.setTitle(awordInfo.wordName, forState:UIControlState.Normal)
        self.titleBtn.setBackgroundImage(UIImage(named: "Btn.png") , forState: UIControlState.Normal)
        self.titleBtn.setBackgroundImage(UIImage(named: "Btn_select.png") , forState: UIControlState.Selected)

        
    }
    
    func setTitleBtnHiden()
    {
        self.titleBtn.hidden = true
        self.userInteractionEnabled = false
    }
    
}
