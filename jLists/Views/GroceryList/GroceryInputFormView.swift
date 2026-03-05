//
//  GroceryInputView.swift
//  jLists
//
//  Created by j on 04/03/2026.
//

import SwiftData
import SwiftUI

struct GroceryInputFormView: View {
    @Environment(\.modelContext) private var modelContext

    @Binding var newItemName: String

    @State private var quantity: Int = 0
    @State private var isFavorite: Bool = false
    @State private var isUrgent: Bool = false

    @Query var favorites: [GroceryFavorite]

    @Query(sort: [SortDescriptor(\GroceryItem.urgency, order: .reverse)])
    var groceryItems: [GroceryItem]

    var body: some View {
        VStack {

            VStack(spacing: 12) {
                TextField("New Item", text: $newItemName)

                Divider()
                    .padding(.horizontal)
                    .padding(.vertical, 5)

                HStack {
                    Toggle("Favorite", isOn: $isFavorite)
                        .fontWeight(.regular)
                        .fixedSize()
                    Spacer()
                    Toggle("Urgent", isOn: $isUrgent)
                        .fontWeight(.regular)
                        .fixedSize()
                }

                Divider()

                HStack {
                    Text("Quantity:")
                        .fontWeight(.regular)
                    Text("\(quantity)")
                        .fontWeight(.medium)
                        .frame(width: 24, alignment: .trailing)
                    Text("(Optional)")
                        .fontWeight(.light)
                    Spacer()

                    Stepper("Quantity", value: $quantity, in: 0...99)
                        .labelsHidden()

                }

                Divider()

                HStack {
                    Button {
                        clearInputs()
                        for item in groceryItems {
                            deleteItem(item)
                        }

                    } label: {
                        Text("Clear")
                    }
                    .disabled(
                        !(isFavorite || isUrgent || quantity > 0
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

        let newItem = GroceryItem(
            name: trimmedName,
            quantity: quantity,
            urgency: isUrgent ? 1 : 0,
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

        modelContext.insert(GroceryFavorite(name: name))
    }

    func deleteItem(_ item: GroceryItem) {
        modelContext.delete(item)
    }

    func clearInputs() {
        newItemName = ""
        quantity = 0
        isUrgent = false
        isFavorite = false
    }
}

#Preview {
    @Previewable @State var name = ""
    GroceryInputFormView(newItemName: $name)
        .modelContainer(PreviewContainer.groceries)
}
