//
//  TopicsViewController.swift
//  learning
//
//  Created by James Hunt on 11/4/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import Firebase

class TopicsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var quizName = ""
    var myList:[String]=[]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//                do {
//                    try  Auth.auth().signOut()}
//                catch {
//                    print("error")}
        
        
        
        
        //        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "newCell")
        //        self.tableView.rowHeight = UITableViewAutomaticDimension
        //        self.tableView.estimatedRowHeight = 200
        
        getNewData { () -> () in
            
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        //cell.mainImage = data[indexPath.row].image
        // cell.messageView.text = myList[indexPath.row]
        cell.messageView.text = myList[indexPath.row]
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myList.count
    }
    
    func getNewData(completion: @escaping () -> ()){
        let user = Auth.auth().currentUser?.uid
        // myList.removeAll()
        
        let ref = Database.database().reference()
        ref.child("/users/\(user!)").observe(.value, with: {(snapshot) in
            
            
            
            let value = snapshot.value as? NSDictionary
            
            
            var nameOfQuizes = value!.allKeys
            
            
            for i in (0..<nameOfQuizes.count){
                
                self.myList.append(nameOfQuizes[i] as! String)
                print(nameOfQuizes[i])
                
                //self.tableView.reloadData()
            }
            completion()
            
            
            
        })
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as! CustomCell
        
        quizName = currentCell.messageView.text!
        
        
        
        
        performSegue(withIdentifier: "starttwo",
                     sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "starttwo"  {
            let svc = segue.destination as! ViewController;
            
            svc.quizName = quizName
            svc.quizUser = (Auth.auth().currentUser?.uid)!
            
        }
       
        
        
        
        
        
        
    }
    
    
    

}
