//
//  TaskTableViewCell.swift
//  Flashback
//
//  Created by Mingo on 2019-07-11.
//  Copyright © 2019 Mingo. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var taskView: UIView!
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
        switch task.category {
        case TaskCategory.defaultCat.rawValue: taskView.backgroundColor = UIColor.gray
        case TaskCategory.green.rawValue: taskView.backgroundColor = UIColor.green
        case TaskCategory.orange.rawValue: taskView.backgroundColor = UIColor.orange
        case TaskCategory.red.rawValue: taskView.backgroundColor = UIColor.red
        case TaskCategory.blue.rawValue: taskView.backgroundColor = UIColor.blue
        case TaskCategory.purple.rawValue: taskView.backgroundColor = UIColor.green
        default: taskView.backgroundColor = UIColor.gray
        }
        
    }

}
