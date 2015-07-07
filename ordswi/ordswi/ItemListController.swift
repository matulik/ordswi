//
//  ItemListController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class ItemListController: UIViewController, UITableViewDelegate , UITableViewDataSource,  UISearchBarDelegate, UISearchDisplayDelegate {
    @IBOutlet var itemListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView register class
        
        self.itemListTableView.reloadData()
        
        self.itemListTableView.setEditing(true, animated: true)
        self.itemListTableView.allowsSelectionDuringEditing = true
        self.itemListTableView.allowsMultipleSelection = false
        self.itemListTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Passing data to another Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ItemEdit" {
            if let destinationViewController = segue.destinationViewController as? EditItemViewController {
                let index = self.itemListTableView.indexPathForSelectedRow()
                println("index=\(index!.row)")
                destinationViewController.item = Content.items[index!.row]
            }
        }
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
  
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("selected row = \(indexPath.row). moving to next segue")
        self.performSegueWithIdentifier("ItemEdit", sender: self)
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let deleteIndex = indexPath.row
        Content.items.removeAtIndex(deleteIndex)
        itemListTableView.reloadData()
    }
    
    // SearchBar
   
    

}
