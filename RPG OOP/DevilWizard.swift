//
//  DevilWizard.swift
//  RPG OOP
//
//  Created by Sibrian on 7/7/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Dark Magic Wand", "Poisonous Amulet", "Future Seeing Glass Eye"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}
