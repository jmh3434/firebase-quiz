//
//  TableViewController.swift
//  learning
//
//  Created by James Hunt on 9/26/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import Firebase

struct CellData {
    let image : UIImage?
    let message : String?
    
}
class TableViewController: UITableViewController {
    
    
    var quizName = ""
    var myList:[String]=["heyllo,yosidjf,asidfj"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        
        
        
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell

        //cell.mainImage = data[indexPath.row].image
        // cell.messageView.text = myList[indexPath.row]
        cell.messageView.text = myList[indexPath.row]
        
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myList.count
    }
    
    func getNewData(completion: @escaping () -> ()){
        let user = Auth.auth().currentUser?.uid
        //myList.removeAll()
        
        let ref = Database.database().reference()
        ref.child("/users/\(user!)").observe(.value, with: {(snapshot) in
            
            
            
            let value = snapshot.value as? NSDictionary
            
            var nameOfQuizes = value!.allKeys
            for i in (0..<nameOfQuizes.count){
                
                self.myList.append(nameOfQuizes[i] as! String)
                print(nameOfQuizes[i])
        
                self.tableView.reloadData()
            }
            completion()
            
            
            
        })
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let currentCell = tableView.cellForRow(at: indexPath) as! CustomCell
//
//        print("did select: ",currentCell.message)
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as! CustomCell
        
        //getting the text of that cell
        let currentItem = currentCell.messageView.text
        
        let alertController = UIAlertController(title: "Simplified iOS", message: "You Selected " + currentItem! , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        
        
       // performSegue(withIdentifier: "quickStart",sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let svc = segue.destination as! GameTime;
//        quickStart = true
//
//
//        svc.quickStart = quickStart
//        svc.quizName = quizName
        
        
    }
    

   
}
