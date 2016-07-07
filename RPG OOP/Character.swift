//
//  Character.swift
//  RPG OOP
//
//  Created by Sibrian on 7/6/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import Foundation

class Character {
    private var _HP: Int = 100
    private var _attackPower: Int = 10
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    
    //HP Getter
    var HP: Int {
        get {
            return _HP
        }
    }
    
    var isAlive: Bool {
        get {
            if HP <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init (startingHP: Int, attackPower: Int) {
        self._HP = startingHP
        self._attackPower = attackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._HP -= attackPower
        
        return true
    }
    
}