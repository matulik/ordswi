//
//  AddItemViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 06/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var costTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    
        // clear errorlabel
        self.errorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addItem(sender: AnyObject) {
        var i = Item()
        var name = nameTextField.text
        var cost = costTextField.text
        if !i.checkName(name) {
            self.errorLabel.text = "Error in name field"
            return
        }
        else if !i.checkCostAsString(cost){
            self.errorLabel.text = "Error in cost field"
            return
        }
        else {
            i = Item(name: name, cost: (cost as NSString).doubleValue)
            Content.items.append(i)
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AddItemToMain", sender: self)
            }
        }
    }
}
