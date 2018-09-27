//
//  HomeViewController.swift
//  learning
//
//  Created by James Hunt on 9/25/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit

class NewQuizViewController: UIViewController {
    
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
        
        
        performSegue(withIdentifier: "showCreate", sender: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCreate" {
            
            let controller = segue.destination as! CreateQuizViewController
            controller.quizName = quizName.text!
            
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
