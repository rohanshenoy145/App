//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by Rohan Shenoy on 6/4/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct calculatorBrain{
    var bmi : BMI?
    mutating func calculateBMI(height:Float, weight:Float)
    {
        let bmiValue = weight/(pow(Float(height), 2))
        if(bmiValue < 18.5)
        {
            bmi = BMI(val: bmiValue, advice: "Eat more", color: UIColor.blue)
        
        }
        else if (bmiValue < 24.9)
        {
            bmi = BMI(val: bmiValue, advice: "Your good", color: UIColor.green)
        }
        else{
            bmi = BMI(val: bmiValue, advice: "Lose weight", color: UIColor.red)
        }
        
    }
    
    func getBMIValue()->String
    {
           
        return String(format:"%.1f", bmi?.val ?? "0.0")
        
    }
    
    func getBMIAdvice()->String
    {
        return bmi?.advice ?? "No comment"
    }
    
    func getColor()->UIColor
    {
        return bmi?.color ?? UIColor.black
    }
    
}
