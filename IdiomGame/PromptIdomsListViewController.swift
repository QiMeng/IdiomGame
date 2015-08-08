//
//  PromptIdomsListViewController.swift
//  IdiomGame
//
//  Created by Lin.Pan on 7/24/15.
//  Copyright (c) 2015 QiMENG. All rights reserved.
//

import UIKit

class PromptIdomsListViewController: UITableViewController {
   
    var promptIdioms : [IdiomInfo]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "提示过的成语"
        let idiomProtocolSQL = IdiomProtocolForSQL.new()
        self.promptIdioms = idiomProtocolSQL.promptIdioms()
        
        let imageviewBack = UIImageView(image: UIImage(named: "promptBack.png"))
        self.tableView.backgroundView = imageviewBack
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backtoHome(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.promptIdioms.count
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.promptIdioms[indexPath.row].hanzi
        cell.detailTextLabel?.text = self.promptIdioms[indexPath.row].jieshi
        
        return cell
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
