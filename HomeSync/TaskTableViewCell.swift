//
//  TaskTableViewCell.swift
//  HomeSync
//
//  Created by Nishan Lama on 4/30/25.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
   
    @IBOutlet weak var taskButton: UIButton!
    var taskButtonChecked = false
    
    @IBAction func taskButtonPressed(_sender: Any){
        taskButtonChecked.toggle()
        
        let imageName = taskButtonChecked ? "checkmark.square" : "square"
        taskButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
}
