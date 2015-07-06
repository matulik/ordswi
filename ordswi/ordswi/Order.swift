//
//  Order.swift
//  ordswi
//
//  Created by CS_praktykant on 06/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import Foundation

class Order {
    
    // Static counter
    static var index : UInt = 1
    class Indexer {
        func nextIndex() {
            index++
        }
        func getIndex() -> UInt {
            return index
        }
    }
    
    // Proporties
    var id : UInt
    var count : UInt
    var items = [Item]()
    
    init() {
        // Counter actions
        var i = Indexer()
        self.id = i.getIndex()
        i.nextIndex()
        //
        self.count = 0
    }
    
    func addItem(item: Item?) {
        if let i = item {
            items.append(item!)
        }
        else {
            println("nil")
        }
    }
    
    func delItemById(id: UInt) {
        var n : Int = 0
        for i in self.items {
            if i.id == id {
                self.items.removeAtIndex(n)
            }
            else {
                n++
            }
        }
    }
    
}