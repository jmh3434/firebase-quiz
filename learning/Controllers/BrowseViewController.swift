//
//  TopicsViewController.swift
//  learning
//
//  Created by James Hunt on 11/4/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit
import Firebase

class BrowseViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var quizName = ""
    var myList:[String]=[]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        //        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "newCell")
        //        self.tableView.rowHeight = UITableViewAutomaticDimension
        //        self.tableView.estimatedRowHeight = 200
        
        getNewData { () -> () in
            
            self.collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BrowseCell
//        //cell.messageView.text = myList[indexPath.row]
//        return cell
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
    
    func getNewData(completion: @escaping () -> ()){
        let user = Auth.auth().currentUser?.uid

        let ref = Database.database().reference()
        ref.child("/users/cTenMLxdEucFAvdhTIxAgqWbchn1").observe(.value, with: {(snapshot) in
            
            
            
            let value = snapshot.value as? NSDictionary
            
            
            var nameOfQuizes = value!.allKeys
            
            
            for i in (0..<nameOfQuizes.count){
                
                self.myList.append(nameOfQuizes[i] as! String)
                print(nameOfQuizes[i])
                
                
            }
            completion()
            
            
            
        })
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)! as! BrowseCell
        
//        quizName = currentCell.messageView.text!
        
        
        
        
        performSegue(withIdentifier: "startone",
                     sender: self)
        
    }
 */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentCell = collectionView.cellForItem(at: indexPath)! as! InsideCollectionViewCell
        
          quizName = currentCell.label.text!
        
        
        
        
        performSegue(withIdentifier: "startone",
                     sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "startone"  {
            let svc = segue.destination as! ViewController;
            
            svc.quizUser = "cTenMLxdEucFAvdhTIxAgqWbchn1"
            svc.quizName = quizName
            
        }
        
        
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myList.count
     
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inside", for: indexPath) as! InsideCollectionViewCell
        cell.label.text = myList[indexPath.row]
        print(cell.label.text)
        return cell
        
    }
    
    
    
}
