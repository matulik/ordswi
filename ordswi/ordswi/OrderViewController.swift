//
//  OrderViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var orderNavBar: UINavigationItem!
    @IBOutlet var orderTableView: UITableView!
    @IBOutlet var itemTableView: UITableView!
    
    var navBarTag : String = ""
    var passingOrderIndex : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        orderNavBar.title = "Order - " + self.navBarTag
        
        // Tables register
        self.itemTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
        self.orderTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "orderCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Tables
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.orderTableView {
            return Content.orders[self.passingOrderIndex-1].items.count
        }
        else { // itemTableView
            return Content.items.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == self.orderTableView {
            var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "orderCell")
            cell.textLabel?.text = Content.orders[self.passingOrderIndex].items[indexPath.row].name
            return cell
        }
        else { // itemTableView
            var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "itemCell")
            cell.textLabel?.text = Content.items[indexPath.row].name
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //
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
