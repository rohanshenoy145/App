//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Rohan Shenoy on 6/4/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var bmiValue: String?
    var bmiMessage: String?
    var bmiColor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = bmiMessage
        bmiLabel.textColor = bmiColor
       
    }
    

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCalculate", sender:self)
        
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
