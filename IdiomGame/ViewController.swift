//
//  ViewController.swift
//  IdiomGame
//
//  Created by Lin on 15/7/18.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var model = IdiomData(aPinyin: "pin", aHanzi: "hanzi", aJieshi: "jieshi", aBiaoji: "biaoji")
        
        
        
        
//        var model  = IdiomData()
//        
//        model.jieshi = "asdf"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

