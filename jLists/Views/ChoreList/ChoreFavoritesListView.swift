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

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    ChoreFavoritesListView(newItemName: .constant(""))
        .modelContainer(PreviewContainer.chores)
}
