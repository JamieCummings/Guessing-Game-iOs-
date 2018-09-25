//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Jamie Cummings on 9/21/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var greatingLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    
    var randomNumber = Int(arc4random_uniform(100) + 1)
    
    var attempts = 5
    
    var playerWins = 0
    
    var playerLosses = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attemptsLabel.text = "Attempts Remaining: \(attempts)"
        greatingLabel.text =
        """
        Welcome
        to The Guessing Game
        """
        recordLabel.text = "Player Wins \(playerWins) Player Losses \(playerLosses)"
    }

    @IBAction func submitTapped(_ sender: Any) {
        var guess : Int? = nil
        guess = Int(guessTextField.text!)
        
        if guess == randomNumber {
            
            guessStatusLabel.text = "You win! :)"
            guessTextField.isHidden = true
            playerWins += 1
            submitButton.isHidden = true
            
        } else if guess! > 100 || guess! < 1 {
            
          guessStatusLabel.text = "Please guess in the range"
            
        } else if guess! > randomNumber {
            guessStatusLabel.text = "Guess is too high"
            attempts -= 1
            if attempts == 0 {
                
                greatingLabel.text = "GAME OVER!"
                guessStatusLabel.text = "Do you want to play again? Please press Reset."
                submitButton.isHidden = true
                guessTextField.isHidden = true
                
            }
        } else if guess! < randomNumber {
            guessStatusLabel.text = "Guess is too low"
            attempts -= 1
            if attempts == 0 {
                
                greatingLabel.text = "GAME OVER!"
                guessStatusLabel.text = "Do you want to play again? Please press Reset"
                submitButton.isHidden = true
                guessTextField.isHidden = true
                playerLosses += 1
                
            }
        }
    
        
    }
    
    @IBAction func resetPushed(_ sender: Any) {
        
        greatingLabel.text =
        """
        Welcome
        to The Guessing Game
        """
        attemptsLabel.text = "Attempts Remaining: \(attempts)"
        guessStatusLabel.text = ""
        submitButton.isHidden = false
        guessTextField.isHidden = false
        attempts = 5
        randomNumber = Int(arc4random_uniform(100) + 1)
        
        
    }
}


