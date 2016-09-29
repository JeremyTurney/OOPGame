//
//  Soldier.swift
//  OOP2
//
//  Created by Jeremy Turney on 9/6/16.
//  Copyright © 2016 Jeremy Turney. All rights reserved.
//

import Foundation

class Soldier: Player
{
    fileprivate var _name: String = "Player"
    
    var name: String
    {
        get
        {
            return _name
        }
    }
    
    override func playerName()-> String
    {
        return name
    }
    
   override func attack()
    {
        //        var weakAttack:Int = 5
        //        var mediumAttack:Int = 8
        //        var highAttack:Int = 15
        //        var missAttack:Int = 0
        let arrayAttack:[String] = ["weakAttack", "mediumAttack", "highAttack", "missAttack"]
        
        let rand = Int(arc4random_uniform(UInt32(arrayAttack.count)))
        
        if (rand == 0)
        {
             attackPwr = 5
        }
        else if (rand == 1)
        {
            attackPwr = 8
        }
        else if (rand == 2)
        {
            attackPwr = 15
        }
        else
        {
            attackPwr = 0
        }
    }
    
    convenience init (Name: String, HP: Int)
    {
        self.init(startingHp: HP)
        _name = Name
    }
    
    
}
