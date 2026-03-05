//
//  ChoreInputFormView.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftData
import SwiftUI

struct ChoreInputFormView: View {
    @Environment(\.modelContext) private var modelContext

    @Binding var newItemName: String

    @Query var favorites: [ChoreFavorite]

    var body: some View {
    }
}

#Preview {
    @Previewable @State var name = ""
    ChoreInputFormView(newItemName: $name)
        .modelContainer(PreviewContainer.chores)
}
