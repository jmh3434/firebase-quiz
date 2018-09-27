 //
//  CustomCell.swift
//  learning
//
//  Created by James Hunt on 9/26/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var messageView: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
   
 
   
}
