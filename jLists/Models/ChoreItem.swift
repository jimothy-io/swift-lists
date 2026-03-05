//
//  ChoreItem.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import Foundation
import SwiftData

@Model
class ChoreItem {
    var name: String
    var priorityValue: Int
    var isChecked: Bool

    var priority: ChorePriority {
        get { ChorePriority(rawValue: priorityValue) ?? .medium }
        set { priorityValue = newValue.rawValue }
    }

    init(
        name: String,
        priority: ChorePriority = .medium,
        isChecked: Bool = false
    ) {
        self.name = name
        self.priorityValue = priority.rawValue
        self.isChecked = isChecked
    }
}

enum ChorePriority: Int, Codable, CaseIterable {
    case low = 0
    case medium = 1
    case high = 2
}

extension ChorePriority {
    var label: String {
        switch self {
        case .low: "Low"
        case .medium: "Medium"
        case .high: "High"
        }
    }
}
