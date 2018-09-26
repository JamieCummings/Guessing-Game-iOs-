//
//  OptionsPage.swift
//  Guessing-Game
//
//  Created by Jamie Cummings on 9/25/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class OptionsPage: UIViewController {
    // these are all the outlets for the slider, labels and button used on this page.
    @IBOutlet weak var numberRange: UISlider!
    @IBOutlet weak var welcomeOptPg: UILabel!
    @IBOutlet weak var numberRangeLb: UILabel!
    @IBOutlet weak var showNumber: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var attempsLable: UILabel!
    @IBOutlet weak var attempsSegment: UISegmentedControl!
    // the following are varaibles for the functions that will follow them.
    var selectedNumber: Int!
    var randomColor: [UIColor] = [.purple, .orange, .yellow, .green, .gray, .black]
    var selectedColor: UIColor!
    var attempsNumber: Int = 5
    // this is the segue that connects the two screens. allows 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? GuessingGameViewController {
            
            viewController.maxNumber = selectedNumber
            
            if selectedNumber == 0 {
                
                viewController.maxNumber = 100
                
            }
            
            viewController.backgroundColor = selectedColor
            viewController.attemptsMax =
            attempsNumber
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // viewDidLoad area will show the following info after it is loaded.
        // this area holds the text for the labels and has the hidded bool for a label.
        
        colorLabel.text = "Press to change background color:"
        welcomeOptPg.text = """
        Welcome!
        Guessing Game
        Menu
        """
        numberRangeLb.text = "Choose max number:"
        showNumber.isHidden = true
        attempsLable.text = "Choose your number of tries:"
    }
    
    @IBAction func rangeSlid(_ sender: UISlider) {
        let currentValue = Int(sender.value) * 10
        selectedNumber = currentValue
        showNumber.isHidden = false
        showNumber.text = "\(currentValue)"
    // this func is for the slider. It is taking the value of the slider setting it to count by 10s, allowing it to start showing the number once its been used, then showing the number in the showNumber label.
        
    }
    @IBAction func colorButtonPress(_ sender: Any) {
        selectedColor = randomColor.randomElement()
        self.view.backgroundColor = selectedColor
        if self.view.backgroundColor == UIColor.white || self.view.backgroundColor == UIColor.yellow || self.view.backgroundColor == UIColor.green {
            attempsLable.textColor = UIColor.black
            welcomeOptPg.textColor = UIColor.black
            numberRangeLb.textColor = UIColor.black
            showNumber.textColor = UIColor.black
            colorLabel.textColor = UIColor.black
            attempsSegment.tintColor = UIColor.black
        } else {
            attempsLable.textColor = UIColor.white
            welcomeOptPg.textColor = UIColor.white
            numberRangeLb.textColor = UIColor.white
            showNumber.textColor = UIColor.white
            colorLabel.textColor = UIColor.white
            attempsSegment.tintColor = UIColor.white
        }
    }
        // this func is for the when the button for the background color is pressed. it is using an array of colors and choosing a random color from the array. then setting it as the background color.
    @IBAction func attemptsSelectorValueChanged(_ sender: Any) {
        if attempsSegment.selectedSegmentIndex == 0 {
            //the value will be 5
            attempsNumber = 5
        } else if attempsSegment.selectedSegmentIndex == 1 {
            // the value will be 10
            attempsNumber = 10
        } else {
            // the value will be 15
            attempsNumber = 15
            // this func is taking the selection the user chooses from the segment to set the attemps to the number selected.
        }
    }
}
