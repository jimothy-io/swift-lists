//
//  GroceryFavoritesList.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import SwiftUI
import SwiftData

struct GroceryFavoritesListView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var newItemName: String

    @Query(sort: [SortDescriptor(\GroceryFavorite.name)])
    var favorites: [GroceryFavorite]

    var body: some View {
        List {
            Section {
                ForEach(favorites) { favorite in
                    Button {
                        newItemName = favorite.name
                    } label: {
                        HStack {
                            Text(favorite.name)
                            Spacer()
                        }
                    }
                    .buttonStyle(.plain)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            withAnimation {
                                deleteFavorite(favorite)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            } header: {
                Label("Favorites", systemImage: "star.fill")
                    .padding(.vertical, 3)
            }
        }
    }

    func deleteFavorite(_ favorite: GroceryFavorite) {
        withAnimation {
            modelContext.delete(favorite)
        }
    }
}


#Preview {
    GroceryFavoritesListView(newItemName: .constant(""))
        .modelContainer(PreviewContainer.groceries)
}
