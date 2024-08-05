//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
   
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    let calcLogic = CalcLogic()
    private var isFinishedTypingNumber : Bool = true
    var displayValue : Double{
        get{
            guard let value  = Double(displayLabel.text!) else{fatalError("Cannot convert label text to a double")}
            return value
        }
        set{
            displayLabel.text = String(newValue)
        }
        
    }
    var decimalV: UIButton?
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
     
       if let calcMethod =  sender.currentTitle
        {
           isFinishedTypingNumber = true
           if let dot = decimalV
           {
               dot.isEnabled = true
           }
           
           if let newValue = calcLogic.doMethod(calcMethod, displayValue)
           {
               displayValue = newValue           }
          
           
       }
           
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle
        {
            
            if isFinishedTypingNumber
            {
                displayLabel.text = numValue
                isFinishedTypingNumber = false

            }
            else
            {
                
                displayLabel.text?.append(numValue)
            }
            if numValue == "."
            {
                decimalV =  sender
                sender.isEnabled = false
            }
        }
    
    }

}

