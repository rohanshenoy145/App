//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Rohan Shenoy on 6/3/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let text:String
    let answers:[String]
    let rightAnswer: String
    init(q:String, a:[String], correctAnswer:String)
    {
        text = q
        answers = a
        rightAnswer =  correctAnswer
    }
}
