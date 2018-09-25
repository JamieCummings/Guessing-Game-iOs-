//
//  OptionsPage.swift
//  Guessing-Game
//
//  Created by Jamie Cummings on 9/25/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class OptionsPage: UIViewController {
    @IBOutlet weak var numberRange: UISlider!
    @IBOutlet weak var welcomeOptPg: UILabel!
    @IBOutlet weak var numberRangeLb: UILabel!
    @IBOutlet weak var showNumber: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    var selectedNumber: Int!
    var randomColor: [UIColor] = [.black, .blue, .purple, .orange, .yellow, .red, .green, .gray]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? GuessingGameViewController {
            viewController.maxNumber = selectedNumber
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        colorLabel.text = "Press to change background color"
        welcomeOptPg.text = "Menu"
        numberRangeLb.text = "Choose max number"
        showNumber.isHidden = true
        
    }
    
    @IBAction func rangeSlid(_ sender: UISlider) {
        let currentValue = Int(sender.value) * 5
        selectedNumber = currentValue
        showNumber.isHidden = false
        showNumber.text = "\(currentValue)"
        
    }
    @IBAction func colorButtonPress(_ sender: Any) {
        self.view.backgroundColor = randomColor.randomElement()
        
    }
}
