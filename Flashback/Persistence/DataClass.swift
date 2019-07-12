//
//  DataClass.swift
//  Flashback
//
//  Created by Mingo on 2019-07-11.
//  Copyright © 2019 Mingo. All rights reserved.
//

import Foundation
import CoreData

class TaskDataClass {
    static let sharedInstance = TaskDataClass() // This is singleton
    var tasks: [Task]!
    
    private init() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            print("start fetch")
            tasks = try Persistence.context.fetch(fetchRequest)
        } catch {
            print("shit, error happened")
        }
    }
    
    func log() {
        dump(tasks)
    }
    
    func appendNewTask(task: Task) {
        tasks.append(task)
    }
    
}

