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
        var name = nameTextField.text
        var cost : Double = (costTextField.text as NSString).doubleValue
        if count(name) <= 0 {
            self.errorLabel.text = "Error in name field"
        }
        // todo
        else {
            var i = Item(name: name, cost: cost)
            Content.items.append(i)
            dispatch_async(dispatch_get_main_queue()){
                self.performSegueWithIdentifier("AddItemToMain", sender: self)
            }
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
