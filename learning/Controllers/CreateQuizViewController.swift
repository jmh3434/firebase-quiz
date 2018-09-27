//
//  CreateQuizViewController.swift
//  learning
//
//  Created by James Hunt on 9/24/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class CreateQuizViewController: UIViewController,UITextFieldDelegate {
    var ref:DatabaseReference?
    
    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answerA: UITextField!
    @IBOutlet weak var answerB: UITextField!
    @IBOutlet weak var answerC: UITextField!
    @IBOutlet weak var answerD: UITextField!
    
    
    var questionObject = QuestionObject()
    var questionBank = QuestionBank()
    var questionIndex = 0
    var quizName = String()
    
    let firebaseRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func correctAnswerPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            questionObject.answer = RightAnswer.a.rawValue
        case 2:
            questionObject.answer = RightAnswer.b.rawValue
        case 3:
            questionObject.answer = RightAnswer.c.rawValue
        case 4:
            questionObject.answer = RightAnswer.d.rawValue
        default:
            print("none pressed")
        }
        
    }
    @IBAction func finish(_ sender: UIButton) {
        questionObject.questionNum = "\(questionIndex)"
        updateChildValues()
    }
    
    
    @IBAction func nextQuestionPressed(_ sender: UIButton) {
        
    
        updateChildValues()
      
    }
    
    
    func updateChildValues() {
        questionObject.question = questionText.text!
        questionObject.a = answerA.text!
        questionObject.b = answerB.text!
        questionObject.c = answerC.text!
        questionObject.d = answerD.text!
        
        questionBank.questions.append(questionObject)
        
        let user = Auth.auth().currentUser?.uid
        
        let variable = questionObject.nsDictionary as NSDictionary
        
        firebaseRef.updateChildValues(["users/\(user!)/\(quizName)/\(questionIndex)/":variable])
        print("quizname",quizName)
        
        questionIndex+=1
        
    }

    @IBAction func signout(_ sender: UIButton) {
        performSegue(withIdentifier: "signout", sender: nil)
    }
    
}













