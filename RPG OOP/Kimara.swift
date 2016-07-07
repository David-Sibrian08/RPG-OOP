//
//  Kimara.swift
//  RPG OOP
//
//  Created by Sibrian on 7/7/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Diamond Dagger", "Kimara Venom", "Tough Armor"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMMUNE_MAX {
            return super.attemptAttack(attackPower)     //call super class function. nothing new is happening here
        } else {
            return false
        }
    }
}