//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func predictPressed(_ sender: Any) {
        guard let model = try? VNCoreMLModel(for: MLModel(contentsOf:MyTextClassifier_1.urlOfModelInThisBundle)) else {fatalError("Loading model failed")}
    }
    
}

