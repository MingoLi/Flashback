//
//  TaskTableViewCell.swift
//  Flashback
//
//  Created by Mingo on 2019-07-11.
//  Copyright © 2019 Mingo. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var taskTextLabel: UILabel!
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setTask(task: Task) {
        taskTextLabel.text = task.content
    }

}
