//
//  Player.swift
//  RPG OOP
//
//  Created by Sibrian on 7/6/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name: String = "User"
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    
    convenience init(name:String, hp: Int, attackPower: Int) {
        self.init(startingHP: hp, attackPower: attackPower)
        _name = name
    }
}