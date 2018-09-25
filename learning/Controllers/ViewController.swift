//
//  ViewController.swift
//  learning
//
//  Created by James Hunt on 8/12/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ViewController: UIViewController {
   
    var index = 0
    var newQuestion = QuestionObject()
    let questionList = QuestionBank()
    
    var handle:DatabaseHandle?
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    var tempArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
            
            
            
            
        
        
        getNewData { () -> () in
            
            print("temp array",self.tempArray)
            self.newQuestion.a = self.tempArray[0]
            self.newQuestion.b = self.tempArray[1]
            self.newQuestion.c = self.tempArray[2]
            self.newQuestion.d = self.tempArray[3]
            self.newQuestion.question = self.tempArray[4]
            self.newQuestion.answer = self.tempArray[5]
            
            self.setLabelsButtons()
        }
        
        
        
        
    }
    func getNewData(completion: @escaping () -> ()){
        let user = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        
        var questionObject = QuestionObject()
        
        self.handle = ref.child("/users/\(user!)").child("0").observe(.childAdded, with: {(snapshot) in
            
            
            let questionItem = snapshot.value as! String
            
            print("qo",questionItem)
            self.tempArray.append(questionItem as String)
            if (self.tempArray.count>5){
                completion()
                
            }
            
            
        })
       
        
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if shortcutItem.type == "Type01" {
            
            //handle action Type01
            
            completionHandler(true)
        } else if shortcutItem.type == "Type02" {
            
            //handle action Type02
            
            completionHandler(true)
        } else {
            completionHandler(false)
        }
        
    }
    
    func generateQuestion(){
        newQuestion.question = questionList.questions[index].question
        newQuestion.a = questionList.questions[index].a
        newQuestion.b = questionList.questions[index].b
        newQuestion.c = questionList.questions[index].c
        newQuestion.d = questionList.questions[index].d
        newQuestion.answer = questionList.questions[index].answer
        index += 1
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let rightAnswerCurrently = newQuestion.answer
        
        switch sender.tag {
        case 1: if rightAnswerCurrently == "a" {button1.backgroundColor = UIColor.green}else {button1.backgroundColor = UIColor.red};button1.setTitleColor(UIColor.white, for: .normal)
        case 2: if rightAnswerCurrently == "b" {button2.backgroundColor = UIColor.green}else {button2.backgroundColor = UIColor.red};button2.setTitleColor(UIColor.white, for: .normal)
        case 3: if rightAnswerCurrently == "c" {button3.backgroundColor = UIColor.green}else {button3.backgroundColor = UIColor.red};button3.setTitleColor(UIColor.white, for: .normal)
        case 4: if rightAnswerCurrently == "d" {button4.backgroundColor = UIColor.green}else {button4.backgroundColor = UIColor.red};button4.setTitleColor(UIColor.white, for: .normal)
            
        default:
            print("carap")
        }
    }
        
    @IBAction func next(_ sender: UIButton) {
        for button in buttons { button.backgroundColor = UIColor.clear}
        for button in buttons { button.setTitleColor(UIColor.red, for: .normal)}
        if index < questionList.questions.count {
            generateQuestion()
            setLabelsButtons()
        }else{
            index = 0
            generateQuestion()
            setLabelsButtons()
        }
        
        
    }
    func setLabelsButtons() {
        questionLabel.text = newQuestion.question
        var answers = [newQuestion.a,newQuestion.b,newQuestion.c,newQuestion.d]
        
        for button in buttons {
            button.setTitle(answers[button.tag-1], for: .normal)
        }
    }
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try  Auth.auth().signOut()}
        catch {
            print("error")}
        performSegue(withIdentifier: "signout", sender: nil)
    }
    
    
}































