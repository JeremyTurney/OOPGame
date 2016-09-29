//
//  Soldier.swift
//  OOP2
//
//  Created by Jeremy Turney on 8/18/16.
//  Copyright © 2016 Jeremy Turney. All rights reserved.
//

import Foundation

class Soldier1:Player1
{
    private var _name: String = "Player1 Soldier"
    
    var name: String
    {
        get
        {
            return _name
        }
    }

    
    func attack()
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
        
        convenience init(Name: String, HP:Int, attackPwr: Int)
        {
            self.init (hp:Int, attackPwr:Int)
            _name = Name
        }
    }
}