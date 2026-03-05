//
//  jListsApp.swift
//  jLists
//
//  Created by j on 22/02/2026.
//

import SwiftUI
import SwiftData

@main
struct jListsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GroceryItem.self,
            GroceryFavorite.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
                .modelContainer(sharedModelContainer)
        }
    }
}
