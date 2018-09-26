//
//  ViewController.swift
//  Guessing-Game
//
//  Created by Jamie Cummings on 9/21/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit
class GuessingGameViewController: UIViewController {
    
    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var greatingLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessStatusLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var recordLabel: UILabel!
    
    
    var attempts = 5
    var attemptsMax: Int!
    var playerWins = 0
    var maxNumber: Int!
    var randomNumber: Int!
    var playerLosses = 0
    var backgroundColor: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guessTextField.keyboardType = .numberPad
        attempts = attemptsMax
        guessTextField.clearsOnBeginEditing = true
        // Do any additional setup after loading the view, typically from a nib.
        attemptsLabel.text = "Attempts Remaining: \(attempts)"
        greatingLabel.text =
        """
        The Guessing Game
        Are you ready?
        """
        recordLabel.text = "Player Wins \(playerWins) Player Losses \(playerLosses)"
        if let max = maxNumber {
            randomNumber = Int.random(in: 0..<max)
        } else {
            randomNumber = Int(arc4random_uniform(100)) + 1
        }
        
        guessStatusLabel.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //Change the background color to the color passed from the other view controller
        self.view.backgroundColor = backgroundColor ?? UIColor.white
        
        if self.view.backgroundColor == UIColor.white || self.view.backgroundColor == UIColor.yellow || self.view.backgroundColor == UIColor.green {
            attemptsLabel.textColor = UIColor.black
            greatingLabel.textColor = UIColor.black
            guessStatusLabel.textColor = UIColor.black
            recordLabel.textColor = UIColor.black
            resetButton.tintColor = UIColor.black
        } else {
            attemptsLabel.textColor = UIColor.white
            greatingLabel.textColor = UIColor.white
            guessStatusLabel.textColor = UIColor.white
            recordLabel.textColor = UIColor.white
            resetButton.tintColor = UIColor.white
            
        }
       
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
        guard let guess = Int(guessTextField.text!) else {
            return
        }
        
        guessStatusLabel.isHidden = false
        guessTextField.endEditing(true)
        if guess == randomNumber {
            
            guessStatusLabel.text = "You win! :)"
            guessTextField.isHidden = true
            playerWins += 1
            recordLabel.text = "Player Wins \(playerWins) Player Losses \(playerLosses)"
            submitButton.isHidden = true
            
        } else if guess > maxNumber || guess < 1 {
            
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
        attempts = attemptsMax
        attemptsLabel.text = "Attempts Remaining: \(attempts)"
        guessStatusLabel.text = " "
        submitButton.isHidden = false
        guessTextField.isHidden = false
        guessTextField.text = ""
        if let max = maxNumber {
            randomNumber = Int.random(in: 0..<max)
        } else {
            randomNumber = Int(arc4random_uniform(100)) + 1
        }
    }
    
}


