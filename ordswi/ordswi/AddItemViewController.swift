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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addItem(sender: AnyObject) {
        
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
