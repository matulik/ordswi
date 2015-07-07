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
            var o = Order()
            Content.orders.append(o)
            self.performSegueWithIdentifier("NewOrder", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NewOrder" {
            let destinationViewController = segue.destinationViewController as? OrderViewController
            destinationViewController?.navBarTag = self.tagTextField.text
        }
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
