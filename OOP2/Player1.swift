//
//  Player1.swift
//  OOP2
//
//  Created by Jeremy Turney on 8/18/16.
//  Copyright © 2016 Jeremy Turney. All rights reserved.
//

import Foundation
class Player1
{
    private var _HP: Int
    private var _attackPwr:Int
    
    
    var HP: Int
        {
        get
        {
            return _HP
        }
    }
    
    var attackPwr:Int
        {
        get
        {
            return _attackPwr
        }
        set
        {
            self.attackPwr = _attackPwr
        }
    }
    
    var isAlive: Bool
    {
        if (_HP <= 0)
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    
    
    init ( hp:Int, attackPwr:Int)
    {
        self._HP = hp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack (attackPwr: Int) ->Bool
    {
        self._HP -= attackPwr
        
        return true
    }
    
    
}



