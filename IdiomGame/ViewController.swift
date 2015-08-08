//
//  ViewController.swift
//  IdiomGame
//
//  Created by Lin on 15/7/18.
//  Copyright (c) 2015年 QiMENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var neverApearIdioms:String!
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let idiomProtocolSQL = IdiomProtocolForSQL.new()
        self.neverApearIdioms = idiomProtocolSQL.neverAppearedIndiomCount()
        
        let str :String = "恭喜您,你还差 \(self.neverApearIdioms) 个成语就可以完成小学所有常用成语"
        var attributedStr = NSMutableAttributedString(string:str)
            attributedStr.addAttribute(NSFontAttributeName, value: UIFont.boldSystemFontOfSize(20), range: NSMakeRange(count("恭喜您,你还差 "),count(self.neverApearIdioms)))
            attributedStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(count("恭喜您,你还差 "),count(self.neverApearIdioms)))
        
        self.label.attributedText =  attributedStr
//        self.label.font = UIFont(name: "Regular", size: 20)
//
//        let fonts = UIFont.familyNames()
        
//        var fontFamily : NSString = "myname" as NSString
//        var fontNames = UIFont.fontNamesForFamilyName(fontFamily as String)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

