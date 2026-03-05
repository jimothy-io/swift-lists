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
    return RootView()
        .modelContainer(PreviewContainer.app)

}
