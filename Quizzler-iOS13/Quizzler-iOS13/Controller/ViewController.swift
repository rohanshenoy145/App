//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quizBrain.getQuestion()
        let choices = quizBrain.getChoices()
        Option1.setTitle(choices[0],for: .normal)
        Option2.setTitle(choices[1],for: .normal)
        Option3.setTitle(choices[2],for: .normal)

        progressBar.progress = quizBrain.getProgess()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let check = quizBrain.checkAnswer(userAnswer)
        if(check == true)
        {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red

        }
        
        
        
         Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
    }
    
    @objc func update()
    {
        let question = quizBrain.updateQuestion()
        let choices = quizBrain.getChoices()
        let progress = quizBrain.getProgess()
        var score = quizBrain.getScore()
        progressBar.progress = progress
        questionLabel.text = question
        scoreLabel.text = String(score)
        Option1.setTitle(choices[0],for: .normal)
        Option2.setTitle(choices[1],for: .normal)
        Option3.setTitle(choices[2],for: .normal)

        Option1.backgroundColor = UIColor.clear
        Option2.backgroundColor = UIColor.clear
        Option3.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    

}

