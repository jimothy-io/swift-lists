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

    @State private var isFavorite: Bool = false
    @State private var priority: ChorePriority = .medium

    @Query var favorites: [ChoreFavorite]

    var body: some View {
        VStack {
            VStack(spacing: 12) {
                TextField("New Item", text: $newItemName)

                Divider()
                    .padding(.vertical, 5)

                HStack {
                    Toggle("Favorite", isOn: $isFavorite)
                        .fontWeight(.regular)
                        .fixedSize()
                    Spacer()
                }

                Divider()


                HStack {
                    Text("Priority")
                        .padding(.trailing, 4)

                    Picker("Priority", selection: $priority) {
                        ForEach(ChorePriority.allCases, id: \.self) { option in
                            Text(option.label)
                                .tag(option)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }


                Divider()

                HStack {
                    Button {
                        clearInputs()
                    } label: {
                        Text("Clear")
                    }
                    .disabled(
                        !(isFavorite || priority != .medium
                            || !newItemName.isEmpty)
                    )

                    Spacer()

                    Button {
                        addItem()
                    } label: {
                        Text("Add Item")
                    }
                    .disabled(
                        newItemName.trimmingCharacters(
                            in: .whitespacesAndNewlines
                        ).count < 2
                    )
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }

    func addItem() {
        let trimmedName = newItemName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard trimmedName.count >= 2 else { return }

        let newItem = ChoreItem(
            name: trimmedName,
            priority: priority,
        )
        modelContext.insert(newItem)

        if isFavorite {
            addFavorite(name: trimmedName)
        }

        clearInputs()
    }

    func addFavorite(name: String) {
        guard
            !favorites.contains(where: {
                $0.name.trimmingCharacters(in: .whitespacesAndNewlines) == name
            })
        else { return }

        modelContext.insert(ChoreFavorite(name: name))
    }

    func deleteItem(_ item: GroceryItem) {
        modelContext.delete(item)
    }

    func clearInputs() {
        newItemName = ""
        priority = .medium
        isFavorite = false
    }
}

#Preview {
    @Previewable @State var name = ""
    ChoreInputFormView(newItemName: $name)
        .modelContainer(PreviewContainer.chores)
}
