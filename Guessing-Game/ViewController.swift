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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        attemptsLabel.text = "Attempts Remaining"
        greatingLabel.text =
        """
        Welcome
        to The Guessing Game
        """
        
    }

    @IBAction func submitTapped(_ sender: Any) {
        var guess : Int? = nil
        guess = Int(guessTextField.text!)
    
        
    }
    
    @IBAction func restPushed(_ sender: Any) {
        
    }
}

