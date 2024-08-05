//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var bmiValue = "0.0"
    var newBrain = calculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var heightValue: UILabel!
    
    @IBOutlet weak var weightValue: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightValue.text = String(round(sender.value*100)/100.0)+"m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightValue.text = String(Int(sender.value))+"Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        newBrain.calculateBMI(height:heightSlider.value, weight:weightSlider.value)
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "goToResults")
        {
            let destination = segue.destination as! ResultsViewController
            destination.bmiValue = newBrain.getBMIValue()
            destination.bmiMessage = newBrain.getBMIAdvice()
            destination.bmiColor = newBrain.getColor()
            
            
        }
    }
}

