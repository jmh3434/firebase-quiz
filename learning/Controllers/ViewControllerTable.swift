//
//  ViewControllerTable.swift
//  learning
//
//  Created by James Hunt on 9/27/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let animals = ["Panda", "Lion", "Elefant"]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (animals.count)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: (animals[indexPath.row] + ".jpg"))
        cell.myLabel.text = animals[indexPath.row]
        
        return (cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
