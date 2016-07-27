//
//  ViewController.swift
//  RPG OOP
//
//  Created by Sibrian on 7/6/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLabel: UILabel!
    
    @IBOutlet weak var playerHpLabel: UILabel!
    
    @IBOutlet weak var enemyHpLabel: UILabel!
    
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    
    @IBOutlet weak var attackButton: UIButton!
    
    //player and enemy will exist 100%. Its properties wont be accessed otherwise
    var player: Player!
    var enemy: Enemy!
    
    var chestContentMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Inate Spectre", hp: 101, attackPower: 20)
        
        generateEnemy()
        
        playerHpLabel.text = "\(player.HP) HP"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateEnemy() {
        attackButton.enabled = true
        
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 55, attackPower: 15)
            enemyHpLabel.text = "\(enemy.HP) HP"
        } else {
            enemy = DevilWizard(startingHP: 50, attackPower: 20)
            enemyHpLabel.text = "\(enemy.HP) HP"
        }
        
        enemyImage.hidden = false
        printLabel.text = "A wild \(enemy.type) has appeared!"
    }

    @IBAction func chestButtonTapped(sender: UIButton) {
        attackButton.enabled = false
        
        chestButton.hidden = true
        
        printLabel.text = chestContentMessage
        
        //set a time before another enemy appears on screen
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackButtonPressed(sender: UIButton) {
        if enemy.attemptAttack(player.attackPower) {
            printLabel.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            enemyHpLabel.text = "\(enemy.HP) HP"
        } else {
            printLabel.text = "Attack was unsuccesful!"
        }
        
        //loot may not drop. Use optional binding
        if let loot = enemy.droploot() {
            player.addItemToInventory(loot)
            chestContentMessage = "\(player.name) has found \(loot)!!"
            chestButton.hidden = false
        }
        
        //if "dead"
        if !enemy.isAlive {
            enemyHpLabel.text = ""
            printLabel.text = "Killed \(enemy.type)!"
            enemyImage.hidden = true
        }
    }
    

}

