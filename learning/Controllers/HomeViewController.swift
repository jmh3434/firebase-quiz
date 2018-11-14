//
//  HomeViewController.swift
//  learning
//
//  Created by James Hunt on 9/25/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var quizName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func takeQuiz(_ sender: Any) {
       
        
        performSegue(withIdentifier: "showSecond", sender: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showSecond" {
//
//                let controller = segue.destination as! CreateQuizViewController
//                controller.quizName = quizName.text!
//
//        }
    }
    
    @IBAction func signout(_ sender: Any) {
        do {
            try  Auth.auth().signOut()
            performSegue(withIdentifier: "out", sender: nil)
        }
        catch {
            print("error")}
    }
    
   

}
