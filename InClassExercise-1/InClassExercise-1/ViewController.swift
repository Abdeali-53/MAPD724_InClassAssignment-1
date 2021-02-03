//  ViewController.swift
//  InClassExercise-1
//  Created by Abdeali Mody on 2021-01-30.
//

import UIKit

class ViewController: UIViewController
{

    // Private Declarations:
    var playerMoney = 500
    var winnings = 25
    var jackpot = 5000
    var playerBet = 10

    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var blanks = 0

    @IBOutlet var betAmount_Text: UILabel!
    @IBOutlet var result_Text: UILabel!
    @IBOutlet var credit_Text: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func spinButton_Clicked(_ sender: UIButton)
    {
        print(spinReels())
        determineWinnings()
        
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        blanks = 0
    }
    
    @IBAction func bet5Button_Clicked(_ sender: UIButton)
    {
        _placeBet(playerBet: 5)
    }
    
    @IBAction func bet10Button_Clicked(_ sender: UIButton)
    {
        _placeBet(playerBet: 10)
    }
    
    @IBAction func bet15Button_Clicked(_ sender: UIButton)
    {
        _placeBet(playerBet: 15)
    }
    
    @IBAction func bet25Button_Clicked(_ sender: UIButton)
    {
        _placeBet(playerBet: 25)
    }
    
    //This function determines the betLine results.
    //e.g. Bar - Orange - Banana
    func spinReels()-> [String]
    {
        var betLine = [" ", " ", " "]
        var outCome = [0, 0, 0]

        for spin in 0...2
        {
            outCome[spin] = Int(floor((Double.random(in: 0...1) * 65) + 1))
            switch (outCome[spin])
            {
            case  _checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                    betLine[spin] = "Blank"
                     blanks += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                    betLine[spin] = "Grapes"
                     grapes += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                    betLine[spin] = "Banana"
                     bananas += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                    betLine[spin] = "Orange"
                     oranges += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                    betLine[spin] = "Cherry"
                     cherries += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                    betLine[spin] = "Bar"
                     bars += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                    betLine[spin] = "Bell"
                     bells += 1
                    break
            case  _checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                    betLine[spin] = "Seven"
                     sevens += 1
                    break
            default:
                print ("Default")
            }
        }
        return betLine
    }

    //This function calculates the player's winnings.
    func determineWinnings()
    {
        if ( blanks == 0)
        {
            if ( grapes == 3)
            {
                 winnings =  playerBet * 10
            }
            else if ( bananas == 3)
            {
                 winnings =  playerBet * 20
            }
            else if ( oranges == 3)
            {
                 winnings =  playerBet * 30
            }
            else if ( cherries == 3)
            {
                 winnings =  playerBet * 40
            }
            else if ( bars == 3)
            {
                 winnings =  playerBet * 50
            }
            else if ( bells == 3)
            {
                 winnings =  playerBet * 75
            }
            else if ( sevens == 3)
            {
                 winnings =  playerBet * 100
            }
            else if ( grapes == 2)
            {
                 winnings =  playerBet * 2
            }
            else if ( bananas == 2)
            {
                 winnings =  playerBet * 2
            }
            else if ( oranges == 2)
            {
                 winnings =  playerBet * 3
            }
            else if ( cherries == 2)
            {
                 winnings =  playerBet * 4
            }
            else if ( bars == 2)
            {
                 winnings =  playerBet * 5
            }
            else if ( bells == 2)
            {
                 winnings =  playerBet * 10
            }
            else if ( sevens == 2)
            {
                 winnings =  playerBet * 20
            }
            else if ( sevens == 1)
            {
                 winnings =  playerBet * 5
            }
            else
            {
                 winnings =  playerBet * 1
            }
            print("Win!!!!!")
            print("winnings: " + String(winnings))
        }
        else
        {
            print("Loss!!!!!!")
        }

        
        // playerMoney +=  winnings
        // credit_Text.text =  String(playerMoney)
    }
    
    //PRIVATE METHODS
    //Utility function to check if a value falls within a range of bounds
    func _checkRange(value: Int, lowerBounds: Int, upperBounds: Int)-> Int
    {
        return (value >= lowerBounds && value <= upperBounds) ? value : -1
    }
    
    func _placeBet(playerBet: Int)
    {
        // ensure player's bet is less than or equal to players money
        if (playerBet <=  playerMoney) {
            self.playerBet += playerBet
             playerMoney -= playerBet
             credit_Text.text =  String(playerMoney)
             betAmount_Text.text =  String(playerBet)
        }
    }
}

