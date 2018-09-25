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
    let myRef = Database.database().reference(withPath: "users  ")
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    var tempArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        getData()
    }
    func getData(){
        getNewData { () -> () in
            
            print("temp array",self.tempArray)
//            self.newQuestion.a = self.tempArray[0]
//            self.newQuestion.b = self.tempArray[1]
//            self.newQuestion.c = self.tempArray[2]
//            self.newQuestion.d = self.tempArray[3]
//            self.newQuestion.question = self.tempArray[4]
//            self.newQuestion.questionNum = self.tempArray[5]
//            self.newQuestion.answer = self.tempArray[6]
           
            if(self.newQuestion.questionNum != ""){
                print("End of Quiz")
            }
            self.setLabelsButtons()
            
        }
    }
    func getNewData(completion: @escaping () -> ()){
        let user = Auth.auth().currentUser?.uid
        let ref = Database.database().reference()
        
        //self.handle = ref.child("/users/\(user!)").child("\(index)").observe(.childAdded, with: {(snapshot) in
        self.handle = ref.child("/users/\(user!)/\(index)").observe(.value, with: { snapshot in
            
           let questionItem = snapshot.value as? [String: Any]
            let question = questionItem!["question"]
            self.newQuestion.a = questionItem!["a"] as! String
            self.newQuestion.b = questionItem!["b"] as! String
            self.newQuestion.c = questionItem!["c"] as! String
            self.newQuestion.d = questionItem!["d"] as! String
            self.newQuestion.question = questionItem!["question"] as! String
            self.newQuestion.questionNum = questionItem!["questionNum"] as! String
            self.newQuestion.answer = questionItem!["theanswer"] as! String
            
            completion()
            
//            if let questionItem = snapshot.value as? String {
//
//                self.tempArray.append(questionItem as String)
//
//                if (self.tempArray.count>6){
//                    completion()
//                }
//            }
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
    
   
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let rightAnswerCurrently = newQuestion.answer
        
        switch sender.tag {
        case 1: if rightAnswerCurrently == "a" {button1.backgroundColor = UIColor.green}else {button1.backgroundColor = UIColor.red};button1.setTitleColor(UIColor.white, for: .normal)
        case 2: if rightAnswerCurrently == "b" {button2.backgroundColor = UIColor.green}else {button2.backgroundColor = UIColor.red};button2.setTitleColor(UIColor.white, for: .normal)
        case 3: if rightAnswerCurrently == "c" {button3.backgroundColor = UIColor.green}else {button3.backgroundColor = UIColor.red};button3.setTitleColor(UIColor.white, for: .normal)
        case 4: if rightAnswerCurrently == "d" {button4.backgroundColor = UIColor.green}else {button4.backgroundColor = UIColor.red};button4.setTitleColor(UIColor.white, for: .normal)
            
        default:
            print("error")
        }
    }
        
    @IBAction func next(_ sender: UIButton) {
       
        for button in buttons { button.backgroundColor = UIColor.clear}
        for button in buttons { button.setTitleColor(UIColor.red, for: .normal)}
        self.index+=1
        
        tempArray.removeAll()
        getData()
        
        
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































