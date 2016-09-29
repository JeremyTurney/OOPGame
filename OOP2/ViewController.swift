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
    var timer = Timer()
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
   
    @IBAction func onOrcBtnPressed(_ sender: AnyObject)
    {
       if (player1 == nil)
       {
            player1Type = 1
            player1 = Orc(Name: "Orc1", HP: 100)
            player1Orc.isHidden = false
            player1HP.isHidden = false
            chooseCharacterLbl.text = "Player 2 choose your character"
        }
        else if (player1 != nil && player2 == nil)
        {
            player2Type = 1
            player2 = Orc(Name: "Orc2", HP: 100)
            player2Orc.isHidden = false
            player2HP.isHidden = false
            onOrcBtnPressed.isHidden = true
            onSoldierBtnPressed.isHidden = true
            chooseCharacterLbl.isHidden = true
            gameLabel()
        }
        else
        {
        
        }
       
        
    }

   @IBOutlet var onSoldierBtnPressed: UIButton!
    
    @IBAction func attackBtn1(_ sender: AnyObject)
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
            attackBtn1.isHidden = true
            attackBtn2.isHidden = true
            restart()
            
        }
        self.attackBtn1.isEnabled = false
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.enableButton1), userInfo: nil, repeats: false)
       
        
    }
    @IBAction func attackBtn2(_ sender: AnyObject)
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
            attackBtn1.isHidden = true
            attackBtn2.isHidden = true
            restart()
            
        }
        self.attackBtn2.isEnabled = false
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.enableButton2), userInfo: nil, repeats: false)
        

    }
    @IBAction func OnSoldier2BtnPressed(_ sender: AnyObject)
    {
    }
    @IBAction func onSoldierBtnPressed(_ sender: AnyObject)
    {
        if (player1 == nil)
        {
            player1 = Soldier(Name: "Soldier1", HP: 100)
            player1Soldier.isHidden = false
            player1HP.isHidden = false
            chooseCharacterLbl.text = "Player 2 choose your character"
            
            
        }
        else if (player1 != nil && player2 == nil)
        {
            player2 = Soldier(Name: "Soldier2", HP: 100)
            player2Soldier.isHidden = false
            player2HP.isHidden = false
            onOrcBtnPressed.isHidden = true
            onSoldierBtnPressed.isHidden = true
            chooseCharacterLbl.isHidden = true
            gameLabel()
        }

    }
    
    @IBOutlet var Quit: UIButton!
    @IBOutlet var NewGame: UIButton!
    @IBAction func onNewGamePressed(_ sender: AnyObject)
    {
        gameLbl.isHidden = true
        NewGame.isHidden = true
        Quit.isHidden = true
        player1 = nil
        player2 = nil
        chooseCharacterLbl.text = "Player 1 choose your character"
        onOrcBtnPressed.isHidden = false
        onSoldierBtnPressed.isHidden = false
        onSoldierBtnPressed.isHidden = false
        onOrcBtnPressed.isHidden = false
        resetCount()
        
    }
    @IBAction func onQuitPressed(_ sender: AnyObject)
    {
        exit(0)
    }

    
    func gameLabel()
    {
        gameLbl.isHidden = false
         timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.gameLabel), userInfo: nil, repeats: false)
       
        if (count != 0)
        {
            gameLbl.text = "Game to start in \(count)"
            countDown()
            
        }
        else
        {
            timer.invalidate()
            gameLbl.text = "Attack!"
            attackBtn1.isHidden = false
            attackBtn2.isHidden = false
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
        player1HP.isHidden = true
        player1Soldier.isHidden = true
        player1Orc.isHidden = true
        player2HP.isHidden = true
        player2Soldier.isHidden = true
        player2Orc.isHidden = true
        chooseCharacterLbl.isHidden = false
        chooseCharacterLbl.text = "Choose an option"
        NewGame.isHidden = false
        Quit.isHidden = false
    }
    
    
    func enableButton1()
    {
        self.attackBtn1.isEnabled = true
        
    }
    func enableButton2()
    {
        self.attackBtn2.isEnabled = true
    }
    
}

