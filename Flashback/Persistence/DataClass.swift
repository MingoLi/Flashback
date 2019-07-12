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
    static var sharedInstance = TaskDataClass() // This is singleton
    private var tasks: [Task]!
    
    private init() {
        
    }
    
    
}

