//
//  ChoreFavoritesListView.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftData
import SwiftUI

struct ChoreFavoritesListView: View {
    @Environment(\.modelContext) private var modelContext

    @Binding var newItemName: String

    @Query(sort: [SortDescriptor(\ChoreFavorite.name)])
    var favorites: [ChoreFavorite]

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

    func deleteFavorite(_ favorite: ChoreFavorite) {
        withAnimation {
            modelContext.delete(favorite)
        }
    }
}

#Preview {
    ChoreFavoritesListView(newItemName: .constant(""))
        .modelContainer(PreviewContainer.chores)
}
