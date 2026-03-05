//
//  GroceryFavorite+Preview.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import Foundation

extension GroceryFavorite {
    static var preview: GroceryFavorite {
        GroceryFavorite(name: "Milk")
    }

    static var previews: [GroceryFavorite] {
        [
            GroceryFavorite(name: "Milk"),
            GroceryFavorite(name: "Eggs"),
            GroceryFavorite(name: "Skyr"),
            GroceryFavorite(name: "Bananas"),
            GroceryFavorite(name: "Chicken"),

        ]
    }
}
