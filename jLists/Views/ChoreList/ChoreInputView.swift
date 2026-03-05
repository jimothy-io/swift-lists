//
//  ChoreInputView.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftUI
import SwiftData

struct ChoreInputView: View {
    @State private var newItemName: String = ""

    var body: some View {
        ChoreInputFormView(newItemName: $newItemName)

        ChoreFavoritesListView(newItemName: $newItemName)
    }
}

#Preview {
    ChoreInputView()
        .modelContainer(PreviewContainer.chores)
}
