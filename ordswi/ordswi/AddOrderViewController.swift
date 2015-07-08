//
//  AddOrderViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {
    @IBOutlet var tagTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    var passingOrderIndex : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.errorLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newOrderButton(sender: AnyObject) {
        if count(self.tagTextField.text) <= 0 {
            self.errorLabel.text = "Error in order name"
            return
        }
        else {
            var o = Order(name: self.tagTextField.text)
            Content.orders.append(o)
            self.passingOrderIndex = Content.orders.count-1
            self.performSegueWithIdentifier("NewOrder", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NewOrder" {
            let destinationViewController = segue.destinationViewController as? OrderViewController
            destinationViewController?.navBarTag = self.tagTextField.text
            destinationViewController?.passingOrderIndex = self.passingOrderIndex
        }
    }
}
