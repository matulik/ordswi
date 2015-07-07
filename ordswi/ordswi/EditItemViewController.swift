//
//  EditItemViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class EditItemViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var costField: UITextField!
    @IBOutlet var errorLabel: UILabel!

    var item : Item = Item()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.nameField.text = item.name
        self.costField.text = String(format: "%.2f", item.cost)
        self.errorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        var name = nameField.text
        var cost = costField.text
        if !self.item.checkName(name) {
            self.errorLabel.text = "Error in name field"
            return
        }
        else if !self.item.checkCostAsString(cost){
            self.errorLabel.text = "Error in cost field"
            return
        }
        else {
            self.item.changeItemData(name, cost: (cost as NSString).doubleValue)
            self.performSegueWithIdentifier("SaveItem", sender: self)
        }
        
    }
}
