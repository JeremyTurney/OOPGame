//
//  ViewController.swift
//  OOP2
//
//  Created by Jeremy Turney on 8/18/16.
//  Copyright © 2016 Jeremy Turney. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var attackBtn2: UIButton!
    @IBOutlet var attackBtn1: UIButton!

    @IBOutlet var player1Soldier: UIImageView!
    
    @IBOutlet var player1Orc: UIImageView!
    
    @IBOutlet var player2Orc: UIImageView!
    
    @IBOutlet var player2Soldier: UIImageView!
    
    @IBOutlet var player1HP: UILabel!
    
    @IBOutlet var player2HP: UILabel!
    
    @IBOutlet var gameLbl: UILabel!
    
    @IBOutlet var chooseCharacterLbl: UILabel!
    
    var player1: Player!
    var player2: Player!
    var timer = NSTimer()
    var count: Int = 3
    var player1Type: Int?
    var player2Type: Int?
    var buttonName: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        chooseCharacterLbl.text = "Player 1 choose your character"
        
    
    }
    @IBOutlet var onOrc2BtnPressed: UIButton!
    @IBOutlet var onSoldier2BtnPressed: UIButton!

    @IBOutlet var onOrcBtnPressed: UIButton!
   
    @IBAction func onOrcBtnPressed(sender: AnyObject)
    {
       if (player1 == nil)
       {
            player1Type = 1
            player1 = Orc(Name: "Orc1", HP: 100)
            player1Orc.hidden = false
            player1HP.hidden = false
            chooseCharacterLbl.text = "Player 2 choose your character"
        }
        else if (player1 != nil && player2 == nil)
        {
            player2Type = 1
            player2 = Orc(Name: "Orc2", HP: 100)
            player2Orc.hidden = false
            player2HP.hidden = false
            onOrcBtnPressed.hidden = true
            onSoldierBtnPressed.hidden = true
            chooseCharacterLbl.hidden = true
            gameLabel()
        }
        else
        {
        
        }
       
        
    }

   @IBOutlet var onSoldierBtnPressed: UIButton!
    
    @IBAction func attackBtn1(sender: AnyObject)
    {
        player1.attack()
        
        if (player1.attackPwr > 0)
        {
            if (player2.attemptAttack(player1.attackPwr))
            {
                gameLbl.text =  "\(player1.playerName()) attacked with a strength of \(player1.attackPwr)"
                updateHP()
            }
            else
            {
                gameLbl.text = "\(player1.playerName())'s attack missed!"
            }
        }
        else
        {
            gameLbl.text = "\(player1.playerName())'s attack missed!"
        }
        
        if (!player2.isAlive)
        {
            gameLbl.text = "\(player2.playerName()) has been slain!"
            attackBtn1.hidden = true
            attackBtn2.hidden = true
            restart()
            
        }
        self.attackBtn1.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableButton1), userInfo: nil, repeats: false)
       
        
    }
    @IBAction func attackBtn2(sender: AnyObject)
    {
        player2.attack()
        
        if (player2.attackPwr > 0)
        {
            if (player1.attemptAttack(player2.attackPwr))
            {
                gameLbl.text =  "\(player2.playerName()) attacked with a strength of \(player2.attackPwr)"
                updateHP()
            }
            else
            {
                gameLbl.text = "\(player2.playerName())'s attack missed!"
            }
        }
        else
        {
            gameLbl.text = "\(player2.playerName())'s attack missed!"
        }
        
        if (!player1.isAlive)
        {
            gameLbl.text = "\(player1.playerName()) has been slain!"
            attackBtn1.hidden = true
            attackBtn2.hidden = true
            restart()
            
        }
        self.attackBtn2.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableButton2), userInfo: nil, repeats: false)
        

    }
    @IBAction func OnSoldier2BtnPressed(sender: AnyObject)
    {
    }
    @IBAction func onSoldierBtnPressed(sender: AnyObject)
    {
        if (player1 == nil)
        {
            player1 = Soldier(Name: "Soldier1", HP: 100)
            player1Soldier.hidden = false
            player1HP.hidden = false
            chooseCharacterLbl.text = "Player 2 choose your character"
            
            
        }
        else if (player1 != nil && player2 == nil)
        {
            player2 = Soldier(Name: "Soldier2", HP: 100)
            player2Soldier.hidden = false
            player2HP.hidden = false
            onOrcBtnPressed.hidden = true
            onSoldierBtnPressed.hidden = true
            chooseCharacterLbl.hidden = true
            gameLabel()
        }

    }
    
    @IBOutlet var Quit: UIButton!
    @IBOutlet var NewGame: UIButton!
    @IBAction func onNewGamePressed(sender: AnyObject)
    {
        gameLbl.hidden = true
        NewGame.hidden = true
        Quit.hidden = true
        player1 = nil
        player2 = nil
        chooseCharacterLbl.text = "Player 1 choose your character"
        onOrcBtnPressed.hidden = false
        onSoldierBtnPressed.hidden = false
        onSoldierBtnPressed.hidden = false
        onOrcBtnPressed.hidden = false
        resetCount()
        
    }
    @IBAction func onQuitPressed(sender: AnyObject)
    {
        exit(0)
    }

    
    func gameLabel()
    {
        gameLbl.hidden = false
         timer =  NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.gameLabel), userInfo: nil, repeats: false)
       
        if (count != 0)
        {
            gameLbl.text = "Game to start in \(count)"
            countDown()
            
        }
        else
        {
            timer.invalidate()
            gameLbl.text = "Attack!"
            attackBtn1.hidden = false
            attackBtn2.hidden = false
        }
    }
    
    func countDown()
    {
        count -= 1
    }

    func resetCount()
    {
        count = 3
    }

    func updateHP()
    {
        if (player2.hp > 0)
        {
            player2HP.text = "\(player2.hp) HP"
        }
        else
        {
            player2HP.text = "0 HP"
        }
        
        if (player1.hp > 0)
        {
            player1HP.text = "\(player1.hp) HP"
        }
        else
        {
            player1HP.text = "0 HP"
        }
        
        
    }
    
    func restart()
    {
        player1HP.text = "100 HP"
        player2HP.text = "100 HP"
        player1HP.hidden = true
        player1Soldier.hidden = true
        player1Orc.hidden = true
        player2HP.hidden = true
        player2Soldier.hidden = true
        player2Orc.hidden = true
        chooseCharacterLbl.hidden = false
        chooseCharacterLbl.text = "Choose an option"
        NewGame.hidden = false
        Quit.hidden = false
    }
    
    
    func enableButton1()
    {
        self.attackBtn1.enabled = true
        
    }
    func enableButton2()
    {
        self.attackBtn2.enabled = true
    }
    
}

