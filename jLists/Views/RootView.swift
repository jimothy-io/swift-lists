//
//  RootView.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftData
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            GroceryListView()
                .tabItem {
                    Label("Groceries", systemImage: "cart")
                }

            GroceryListView()
                .tabItem {
                    Label("Chores", systemImage: "checklist")
                }
        }
    }
}

#Preview {
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

    return RootView()
        .modelContainer(container)

}
