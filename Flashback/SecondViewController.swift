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
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            print("start fetch")
            tasks = try Persistence.context.fetch(fetchRequest)
            TaskList.reloadData()
        } catch {
            print("shit, error happened")
        }
        
        TaskList.delegate = self
        TaskList.dataSource = self
    }
    
    
    
}

extension TaskListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        
        cell.setTask(task: task)
        return cell
    }
    
}
