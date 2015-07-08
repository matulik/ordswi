//
//  OrderListController.swift
//  ordswi
//
//  Created by CS_praktykant on 08/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class OrderListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var orderTableView: UITableView!
    
    var passingOrderIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.orderTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.orderTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Content.orders.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = Content.orders[indexPath.row].tag
        
        var isOrderedString = ""
        if Content.orders[indexPath.row].isOrdered {
            isOrderedString = "issued"
        }
        else {
            isOrderedString = "waiting"
        }
        var orderCost : String = String(format: "%.2f", Content.orders[indexPath.row].orderCost)
        cell.detailTextLabel?.text = "Total cost: " + orderCost + " | " + isOrderedString
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.passingOrderIndex = indexPath.row
        println("passing:\(indexPath.row). orders:\(Content.orders.count)")
        self.performSegueWithIdentifier("OrderListToEdit", sender: self)
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OrderListToEdit" {
            let destinationViewController = segue.destinationViewController as? OrderViewController
            destinationViewController?.navBarTag = Content.orders[self.passingOrderIndex].tag
            destinationViewController?.passingOrderIndex = self.passingOrderIndex
        }
    }
    
}
