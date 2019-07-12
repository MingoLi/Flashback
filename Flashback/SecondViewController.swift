//
//  TaskListViewController.swift
//  Flashback
//
//  Created by Mingo on 2019-07-04.
//  Copyright © 2019 Mingo. All rights reserved.
//

import UIKit
import CoreData

class TaskListViewController: UIViewController {

    @IBOutlet weak var TaskList: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TaskList.reloadData()
        
        TaskList.delegate = self
        TaskList.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        TaskList.reloadData()
    }
}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskDataClass.sharedInstance.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = TaskDataClass.sharedInstance.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        
        cell.setTask(task: task)
        return cell
    }
    
}
