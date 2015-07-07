//
//  ItemListController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class ItemListController: UIViewController, UITableViewDelegate , UITableViewDataSource{
    @IBOutlet var itemListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView register class
        
        self.itemListTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // TableView functions - DataSource prot.
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Content.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = Content.items[indexPath.row].name
        //cell.detailTextLabel?.text =  "ASD" as String //String(format:"%f", Content.items[indexPath.row].cost) + " $"
        */
        
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = Content.items[indexPath.row].name
        cell.detailTextLabel?.text =  String(format:"%.2f", Content.items[indexPath.row].cost) + " $"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected row = \(indexPath.row)")
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
