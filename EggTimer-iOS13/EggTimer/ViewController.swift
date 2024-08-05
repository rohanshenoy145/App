//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft":2, "Medium":5, "Hard":10]
    var secondsRemaining = 60
    var timer = Timer()
    var originalTime = 60
    
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet weak var titleScreen: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        titleScreen.text = "How do you like your eggs?"
        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!
        originalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
        
        
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            secondsRemaining-=1
            
        }
        else{
            timer.invalidate()
            titleScreen.text = "Done!"
        }
        progressBar.progress = 1.0 - (Float(secondsRemaining)/Float(originalTime))
            print("\(Float(secondsRemaining)/Float(originalTime))seconds.")
        
        
    }
    

}
