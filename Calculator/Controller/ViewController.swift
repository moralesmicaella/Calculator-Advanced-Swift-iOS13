//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isDoneTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = Calculator.isInt(newValue) ? String(Int(newValue)) : String(newValue)
        }
    }
    
    private var calculator = Calculator()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isDoneTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayValue )
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
            if calcMethod == "+/-" {
                isDoneTypingNumber = false
            }
        }
            
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isDoneTypingNumber {
                isDoneTypingNumber = false
                if numValue == "." {
                    displayLabel.text = "0."
                    return
                }
                displayLabel.text = numValue
            } else {
                if numValue == "." {
                    if !Calculator.isInt(displayValue) {
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
    }


}

