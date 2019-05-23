//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //pull all questions data from question bank class to this controller
    //basically importing a model to this view
    //Place your instance variables here
    var allQuestions = QuestionBank()

    //create a new variable to hold the answer the user picked from the ui either true or false
    var pickedAnswer : Bool = false
    //helps to keep track which question the user is on
    var questionNumber : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    //This gets called when the UIViewController into the memory when the app starts
    override func viewDidLoad() {
        super.viewDidLoad()
        //remember, in swift the properties of an object are accessed using the dot notation
        //we want to display the first question upon loading the first screen of the app
        let firstQuestion = allQuestions.list[0] //0 index grabs the data or first element of the array
        
        //after grabbing the firstQuestion data from the model, display this question in the questionLabel on the screen
        questionLabel.text = firstQuestion.questionText
        
    }
    
    //Nothing to modify here. This gets called when the system is low on the memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //this action gets called when either a true or false button is pressed..
    //which means we have to use tag of each of those buttons to get the exact button that was clicked either true or false.. i.e sender.tag
    @IBAction func answerPressed(_ sender: AnyObject) {
//        print(sender.tag)
        //to know which button the user pressed, we have to log or check the tag assigned to the button which the user clicks, which is sender.tag
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        //after collecting or verifying which answer the user clicked, then we have to checkAnswer the user clicked
        //to the correct answer tied to the question
        let answer = allQuestions.list[0]
        checkAnswer()
        //after the user must have selected any answer and validated the correctAnswer, we have to increase the question number so we can make the user move to the next page or next question
        //increate the question number to one after user has choosed an option
        questionNumber += 1
        nextQuestion()
    }
    
    
    //This method will update all the views on the screen (progress bar, score label, etc
    func updateUI() {
      
    }
    
    //This method will update the question text field and check if we reached the end
    func nextQuestion() {
        //this gets executed every single time an answer is pressed
        //here we are just updating the question label to the next data questionText.. we are not changing to the next screen in anyways
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            //displays allert message to the user
            let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions, do you want to start all over again ?", preferredStyle: .alert)
            
            //this code gets executed when the user clicks i want to restart
            //basicaly UIAlertAction returns a closer (UIAlertAction) that returns or execute a block of code
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                
                //note that when u r returning a closure u have to add the keyword self this helps
                self.startOver()
            }
            
            //this executes the restartAction closure of UIAlertAction
            alert.addAction(restartAction)
            
            print("End of Quiz")
            //reset question number so the app can take the user back to question 0
            questionNumber = 0
        }
        
    }
    
    
    func checkAnswer() {
        //in all questions data, grab the list array, find the answer property of the first question in the array and save it as correctAnswer
        
        //here questionNumber is dynamic because we increment the questionNumber counter everytime the user hits true or false button
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            //print to the screen that the user got the answer
            print("You got it!")
        } else {
            print("wrong!")
        }
    }
    
    
    func startOver() {
       
    }
    

    
}
