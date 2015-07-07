//
//  ViewController.swift
//  ordswi
//
//  Created by CS_praktykant on 06/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import UIKit

var firstRun = true

struct Content {
    static var items = [Item]()
    static var orders = [Order]()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(firstRun){
            var i1 = Item(name: "Some", cost: 1.12)
            var i2 = Item(name: "Other", cost: 23.33)
            var i3 = Item(name: "Something", cost: 13.99)
            Content.items.append(i1)
            Content.items.append(i2)
            Content.items.append(i3)
            firstRun = false;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

