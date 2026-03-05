//
//  GroceryItem.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import Foundation
import SwiftData

@Model
class GroceryItem {
    var name: String
    var quantity: Int
    var urgency: Int
    var isChecked: Bool

    init(name: String, quantity: Int = 0, urgency: Int = 0, isChecked: Bool = false) {
        self.name = name
        self.quantity = quantity
        self.urgency = urgency
        self.isChecked = isChecked
    }
}
