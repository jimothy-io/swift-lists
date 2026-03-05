//
//  GroceryItem+Demo.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import Foundation

extension GroceryItem {
    static var preview: GroceryItem {
        GroceryItem(
            name: "Milk",
            quantity: 2,
            urgency: 1
        )
    }

    static var previews: [GroceryItem] {
        [
            GroceryItem(name: "Milk", urgency: 1),
            GroceryItem(name: "Eggs", quantity: 12, isChecked: true),
            GroceryItem(name: "Skyr", quantity: 6, urgency: 1),
            GroceryItem(name: "Bananas", quantity: 6),
            GroceryItem(name: "Chicken", urgency: 1, isChecked: true),
            GroceryItem(name: "Greek Yogurt", quantity: 4),
            GroceryItem(name: "Frozen Berries", quantity: 1, isChecked: true),
            GroceryItem(name: "Spinach"),
            GroceryItem(name: "Tomatoes", quantity: 3),
            GroceryItem(name: "Onions"),
            GroceryItem(name: "Garlic", quantity: 1, isChecked: true),
            GroceryItem(name: "Olive Oil", quantity: 1),
            GroceryItem(name: "Pasta"),
            GroceryItem(name: "Parmesan", quantity: 1),
            GroceryItem(name: "Coffee", urgency: 1),
        ]
    }
}
