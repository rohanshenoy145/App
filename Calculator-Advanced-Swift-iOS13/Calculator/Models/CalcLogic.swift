//
//  CalcLogic.swift
//  Calculator
//
//  Created by Rohan Shenoy on 6/23/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol calcLogicDelegate
{
    
}

class CalcLogic

{
    
    private var intermediateCalculation : (n1: Double, method: String)?
    
    
    func doMethod(_ calcMethod: String, _ displayValue: Double)->Double?
    {
        
        
        if calcMethod == "+/-"
        {
             return displayValue * -1
        }
            
        else if calcMethod == "AC"
        {
            
            return 0.0
            
        }
        else if calcMethod == "%"
        {
              return displayValue*0.01
            
        }
        
        else if calcMethod == "="
        {
            return performTwoNumberCalculation(displayValue)
        }
        else
        {
            intermediateCalculation = (n1:displayValue, method: calcMethod)
        }
    
        return nil
    }
    
    func performTwoNumberCalculation(_ value:Double ) -> Double?
    {
        if let method = intermediateCalculation?.method, let firstNum = intermediateCalculation?.n1
        {
            if(method == "+")
            {
                return firstNum + value
            }
            else if(method == "-")
            {
                return firstNum - value
            }
            else if(method == "×")
            {
                return firstNum * value
            }
            else if(method == "÷")
            {
                return firstNum / value
            }
            else{
                fatalError("No match for operation")

            }
        }
        return nil
            
    }

}





