//
//  OrderViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 07/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet var orderNavBar: UINavigationItem!
    @IBOutlet var orderTableView: UITableView!
    @IBOutlet var itemTableView: UITableView!
    
    var navBarTag : String = ""
    var order : Order = Order()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        orderNavBar.title = "Order - " + self.navBarTag
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
