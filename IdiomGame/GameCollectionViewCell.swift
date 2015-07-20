//
//  GameCollectionViewCell.swift
//  IdiomGame
//
//  Created by Lin on 15/7/19.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleBtn: UIButton!
    
    @IBAction func titleBtnClick(sender: UIButton) {
        
        sender.selected = !sender.selected
        if(sender.selected ){
            sender.backgroundColor = UIColor.redColor()
        }else{
            sender.backgroundColor = UIColor.whiteColor()
        }
        print("点击按钮")
    }
    
    func setbackClick()
    {
        titleBtn.removeFromSuperview()
        self.contentView.backgroundColor = UIColor.clearColor()
        self.backgroundColor = UIColor.clearColor()
        self.userInteractionEnabled = false
    }
    
}
