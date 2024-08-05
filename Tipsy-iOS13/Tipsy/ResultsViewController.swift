//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rohan Shenoy on 6/7/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var answer: Double? = nil
    var people: Int? = nil
    var tip : String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeAnswer = self.answer
        {
        splitAnswer.text = String(format: "%.2f",safeAnswer)
        }
        if let safePeople = (self.people),  let safeTip = self.tip
        {
            comment.text = "Split between \(String(safePeople)) people with \(safeTip)tip"
        }
        
   
    }
    
    
    @IBOutlet weak var splitAnswer: UILabel!
    @IBOutlet weak var comment: UILabel!
    
    @IBAction func recalculate(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "showOptions", sender: self)
    }
    
   
    
}
            
   
             
             
             
             
             
             // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    


