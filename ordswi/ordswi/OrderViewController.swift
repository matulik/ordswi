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
    @IBOutlet var setIssuedButton: UIButton!
    @IBOutlet var totalCostLabel: UILabel!
    
    var navBarTag : String = ""
    var passingOrderIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        orderNavBar.title = "Order - " + self.navBarTag
        
        // Tables register
        self.orderTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "orderCell")
        self.itemTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "itemCell")
        
        // IssueButton
        if Content.orders[self.passingOrderIndex].isOrdered {
            self.setIssuedButton.setTitle("Issued", forState: UIControlState.Normal)
            self.setIssuedButton.enabled = false
        }
        
        // TablesView
        //self.itemTableView.setEditing(true, animated: true)
        
        self.itemTableView.setEditing(true, animated: true)
        self.itemTableView.editing = true
        self.orderTableView.setEditing(true, animated: true)
        self.orderTableView.editing = true
        self.itemTableView.hidden = true
        self.orderTableView.hidden = false
        self.orderNavBar.title = self.orderNavBar.title! + " (orderview)"
        self.orderTableView.reloadData()
        self.itemTableView.reloadData()
        self.updateCostLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button
    
    @IBAction func setAsIssued(sender: AnyObject) {
        Content.orders[self.passingOrderIndex].isOrdered = true
        self.setIssuedButton.setTitle("Issued", forState: UIControlState.Normal)
        self.setIssuedButton.enabled = false
    }
    
    @IBAction func switchTables(sender: AnyObject) {
        println(self.itemTableView.hidden)
        if self.orderTableView.hidden {
            self.orderTableView.hidden = false
            self.itemTableView.hidden = true
            self.setIssuedButton.hidden = false
            self.totalCostLabel.hidden = false
            self.orderNavBar.title = "Order - " + self.navBarTag + " (orderview)"
        }
        else {
            self.orderTableView.hidden = true
            self.itemTableView.hidden = false
            self.setIssuedButton.hidden = true
            self.totalCostLabel.hidden = true
            self.orderNavBar.title = "Order - " + self.navBarTag + " (itemview)"
        }
        self.orderTableView.reloadData()
        self.itemTableView.reloadData()
    }
    
    func updateCostLabel() {
        self.totalCostLabel.text = "$ " + String(format:"%.2f", Content.orders[self.passingOrderIndex].orderCost)
    }
    
    // Tables
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.orderTableView {
            return Content.orders[self.passingOrderIndex].items.count
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
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView == self.orderTableView {
            return UITableViewCellEditingStyle.Delete
        }
        else {
            return UITableViewCellEditingStyle.Insert
        }
    }
    
    // AlertView
    // #TODO# auto alert hide // Function to handle touch and dismiss alert
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if tableView == self.itemTableView {
            Content.orders[self.passingOrderIndex].addItem(Content.items[indexPath.row])
            self.updateCostLabel()
            var addAlert : UIAlertController = UIAlertController(title: "OK!", message: "Item added successfully", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            addAlert.addAction(okAction)
            self.presentViewController(addAlert, animated: true, completion: nil)
        }
        else {
            println("Delete: orderindex:\(self.passingOrderIndex) count:\(Content.orders[self.passingOrderIndex].items.count) row:\(indexPath.row)")
            Content.orders[self.passingOrderIndex].removeItemByIndex(indexPath.row)
            self.updateCostLabel()
            self.orderTableView.reloadData()
        }
    }
    

    
}
