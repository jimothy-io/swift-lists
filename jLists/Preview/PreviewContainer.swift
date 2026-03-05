//
//  PreviewContainer.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import Foundation
import SwiftData

enum PreviewContainer {
    static var chores: ModelContainer {
        let container = try! ModelContainer(
            for: ChoreItem.self,
            ChoreFavorite.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        for item in ChoreItem.previews {
            context.insert(item)
        }
        for favorite in ChoreFavorite.previews {
            context.insert(favorite)
        }

        return container
    }

    static var groceries: ModelContainer {
        let container = try! ModelContainer(
            for: GroceryItem.self,
            GroceryFavorite.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        for item in GroceryItem.previews {
            context.insert(item)
        }
        for favorite in GroceryFavorite.previews {
            context.insert(favorite)
        }

        return container
    }

    static var app: ModelContainer {
        let container = try! ModelContainer(
            for: ChoreItem.self,
            ChoreFavorite.self,
            GroceryItem.self,
            GroceryFavorite.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )

        let context = container.mainContext
        for item in ChoreItem.previews {
            context.insert(item)
        }
        for favorite in ChoreFavorite.previews {
            context.insert(favorite)
        }
        for item in GroceryItem.previews {
            context.insert(item)
        }
        for favorite in GroceryFavorite.previews {
            context.insert(favorite)
        }

        return container
    }
}
