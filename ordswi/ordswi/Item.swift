//
//  item.swift
//  ordswi
//
//  Created by CS_praktykant on 06/07/15.
//  Copyright (c) 2015 mt. All rights reserved.
//

import Foundation


class Item {
    
    // Static counter prop.
    static var index : UInt = 1
    class Indexer {
        func nextIndex(){
            index++
        }
        func getIndex() -> UInt {
            return index
        }
    }
    
    // Another prop.
    var id : UInt
    var name : String
    var cost : Double
    
    init(){
        // Counter actions
        var i = Indexer()
        self.id = i.getIndex()
        i.nextIndex()
        //
        self.name = ""
        self.cost = 0.0
    }
    
    init(name: String?, cost: Double?) {
        // Counter actions
        var i = Indexer()
        self.id = i.getIndex()
        i.nextIndex()
        //
        if let n = name {
            self.name = n
        }
        else {
            self.name = ""
        }
        if let c = cost {
            self.cost = c
        }
        else {
            self.cost = 0.0
        }
        println("Item added by init.")
    }
    
    func checkName(name: String) -> Bool {
        if count(name) <= 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func checkCostAsString(cost: String) -> Bool {
        return true
    }
    
    func changeItemData(name: String, cost: Double) {
        self.name = name
        self.cost = cost
    }
    
}

