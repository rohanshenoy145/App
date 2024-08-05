//
//  calculateTip.swift
//  Tipsy
//
//  Created by Rohan Shenoy on 6/7/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct calculateTip
{
   
    
    func calculateTipPerPerson(_ tip:Double, _ people:Int, _ bill: String) -> Double
    {
        let bill = Double(bill)
        let totalSum = bill! + bill!*tip
        return totalSum/Double(people)
    }
}
