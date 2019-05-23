//
//  Question.swift
//  Quizzler
//
//  Created by Nurudeen on 22/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    //create variables such that every question has a question text and an answer which could be true or false
    var questionText : String = "am I Real ?"
    var answer : Bool = true //true or false
    
    //this is like a class constructor such that whenever this class is called, the init function must get execusted
    init(text : String, correctAnswer : Bool){
        questionText = text
        answer = correctAnswer
    }
}

//way of using the class

//class myOtherClass {
//    let question = Question(text : "Are all developers designers ?", correctAnswer : false)
//    
//
//}
