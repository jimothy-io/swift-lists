//
//  GroceryInputView.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import SwiftUI
import SwiftData

struct GroceryInputView: View {
    @State private var newItemName: String = ""

    var body: some View {
        GroceryInputFormView(newItemName: $newItemName)

        GroceryFavoritesListView(newItemName: $newItemName)
    }
}

#Preview {
    GroceryInputView()
        .modelContainer(for: [GroceryItem.self, GroceryFavorite.self])
}
