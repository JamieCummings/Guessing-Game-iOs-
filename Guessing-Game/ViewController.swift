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
        guessTextField.keyboardType = .numberPad
        guessTextField.clearsOnBeginEditing = true
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
        
        guard let guess = Int(guessTextField.text!) else {
            return
        }
        guessTextField.endEditing(true)
        if guess == randomNumber {
            
            guessStatusLabel.text = "You win! :)"
            guessTextField.isHidden = true
            playerWins += 1
            recordLabel.text = "Player Wins \(playerWins) Player Losses \(playerLosses)"
            submitButton.isHidden = true
            
        } else if guess > 100 || guess < 1 {
            
          guessStatusLabel.text = "Please guess in the range"
            
        } else if guess > randomNumber {
            guessStatusLabel.text = "Guess is too high"
            attempts -= 1
            attemptsLabel.text = "Attempts Remaining: \(attempts)"
            if attempts == 0 {
                
                greatingLabel.text = "GAME OVER!"
                guessStatusLabel.text = "Do you want to play again? Please press Reset."
                submitButton.isHidden = true
                guessTextField.isHidden = true
                
            }
        } else if guess < randomNumber {
            guessStatusLabel.text = "Guess is too low"
            attempts -= 1
            attemptsLabel.text = "Attempts Remaining: \(attempts)"
            if attempts == 0 {
                
                greatingLabel.text = "GAME OVER!"
                guessStatusLabel.text = "Do you want to play again? Please press Reset"
                submitButton.isHidden = true
                guessTextField.isHidden = true
                playerLosses += 1
                recordLabel.text = "Player Wins \(playerWins) Player Losses \(playerLosses)"
            }
        }
    
        
    }
    
    @IBAction func resetPushed(_ sender: Any) {
        
        greatingLabel.text =
        """
        Welcome
        to The Guessing Game
        """
        attempts = 5
        attemptsLabel.text = "Attempts Remaining: \(attempts)"
        guessStatusLabel.text = " "
        submitButton.isHidden = false
        guessTextField.isHidden = false
        guessTextField.text = ""
        randomNumber = Int(arc4random_uniform(100) + 1)
        
        
    }
}


