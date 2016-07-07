//
//  Enemy.swift
//  RPG OOP
//
//  Created by Sibrian on 7/6/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty Dagger", "Sharpened Blade"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    //loot could drop, but it may not as well
    func droploot() -> String? {
        if !isAlive {
            let randomLoot = Int(arc4random_uniform(UInt32(loot.count)))
            
            return loot[randomLoot]
        }
        return nil
    }
}
