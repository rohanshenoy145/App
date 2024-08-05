//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController, UITextFieldDelegate {
    var buttonSelectedValue: String?
    var answer: Double? = 0.0
    var tip: NSNumber?
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.delegate = self
        button1.isSelected = true
        button2.isSelected = false
        button3.isSelected = false
        buttonSelectedValue = button1.titleLabel?.text
       // billAmount.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var splitAmount: UIStepper!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        billAmount.endEditing(true)
        button1.isSelected = false
        button2.isSelected = false
        button3.isSelected = false
        sender.isSelected = true
        buttonSelectedValue = sender.titleLabel?.text
        
        
    }
    
    @IBAction func splitValue(_ sender: UIStepper)
    {
        splitLabel.text = String(Int(splitAmount.value))
    }
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        
            tip = formatter.number(from: buttonSelectedValue!)
            let brain = calculateTip()
        if  billAmount.text != ""
        {
            self.answer = brain.calculateTipPerPerson( Double(truncating: tip!),Int(splitAmount.value), (billAmount.text!))
                print(self.answer!)
            performSegue(withIdentifier: "showResults", sender: self)
        }
           
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "showResults")
        {
            let destination = segue.destination as!  ResultsViewController
            destination.answer = self.answer
            destination.people = Int(splitAmount.value)
            destination.tip = buttonSelectedValue
        }
        
        
        
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        if(textField.text == "")
        {
            return false
        }
        else{
            return true
        }
    }
    
}
    
    
    
    


