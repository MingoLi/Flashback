//
//  Constant.swift
//  Flashback
//
//  Created by Mingo on 2019-07-07.
//  Copyright © 2019 Mingo. All rights reserved.
//

import Foundation

struct Strings {
    static let TapToRecord = "Tap to Record"
    static let RecordingInProgress = "Recording in Progress"
}

enum TaskCategory: Int16, CaseIterable {
    case defaultCat = 0
    case green
    case orange
    case red
    case blue
    case purple
}
