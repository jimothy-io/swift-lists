//
//  ChoreItem+Preview.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import Foundation

extension ChoreItem {
    static var preview: ChoreItem {
        ChoreItem(
            name: "Take out trash",
            priority: .high
        )
    }

    static var previews: [ChoreItem] {
        [
            ChoreItem(name: "Take out trash", priority: .high),
            ChoreItem(name: "Do laundry", priority: .medium),
            ChoreItem(name: "Wash dishes", priority: .high, isChecked: true),
            ChoreItem(name: "Vacuum living room", priority: .medium),
            ChoreItem(name: "Clean bathroom", priority: .high),
            ChoreItem(name: "Water plants", priority: .low),
            ChoreItem(name: "Change bed sheets", priority: .medium),
            ChoreItem(
                name: "Empty dishwasher",
                priority: .low,
                isChecked: true
            ),
            ChoreItem(name: "Wipe kitchen counters", priority: .medium),
            ChoreItem(name: "Take recycling out", priority: .low),
            ChoreItem(name: "Mop kitchen floor", priority: .high),
            ChoreItem(name: "Dust shelves", priority: .low),
            ChoreItem(name: "Clean fridge", priority: .medium),
            ChoreItem(name: "Organize pantry", priority: .low),
            ChoreItem(
                name: "Clean stovetop",
                priority: .medium,
                isChecked: true
            ),
        ]
    }
}
