//
//  Player.swift
//  OOP2
//
//  Created by Jeremy Turney on 9/6/16.
//  Copyright © 2016 Jeremy Turney. All rights reserved.
//

import Foundation

class Player
{
    fileprivate var _hp: Int = 100
    var attackPwr: Int = 0
    
    var hp: Int
    {
        get
        {
            return _hp
        }
        set
        {
            
        }
    }
    
    
    var isAlive: Bool
        {
        get
        {
            if (hp <= 0)
            {
                return false
            }
            else
            {
                return true
            }
        }
    }
    
    init (startingHp: Int)
    {
        self._hp = startingHp
    }
    
    func attack()
    {
        attackPwr = 0
    }
    
    func attemptAttack (_ attackPwr: Int) ->Bool
    {
        self._hp -= attackPwr
        
        return true
    }
    
    func playerName()-> String
    {
        return ""
    }
    
    
}

