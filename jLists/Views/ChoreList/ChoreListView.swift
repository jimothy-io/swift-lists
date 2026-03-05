//
//  GroceryListView.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftData
import SwiftUI

struct ChoreListView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: [
        SortDescriptor(\GroceryItem.urgency, order: .reverse),
        SortDescriptor(\GroceryItem.name),
    ])
    var groceryItems: [GroceryItem]

    @State private var showingAddItem: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(groceryItems) { item in
                    Button {
                        withAnimation {
                            item.isChecked.toggle()
                        }
                    } label: {
                        HStack(alignment: .center, spacing: 4) {
                            Image(
                                systemName: item.isChecked
                                    ? "checkmark.circle.fill" : "circle"
                            )
                            .foregroundStyle(
                                item.isChecked ? .primary : .secondary
                            )
                            .padding(.trailing, 6)

                            let quantityText =
                                item.quantity > 0
                                ? Text("\(item.quantity) ×")
                                    .foregroundStyle(.secondary)
                                    .font(.subheadline)
                                : Text("")
                            let nameText = Text(item.name)
                                .foregroundStyle(
                                    item.isChecked ? .secondary : .primary
                                )
                                .fontWeight(
                                    item.urgency > 0 ? .semibold : .regular
                                )

                            Text("\(quantityText) \(nameText)")
                                .strikethrough(item.isChecked)

                            Spacer()
                        }
                        .background(
                            item.urgency > 0
                                ? Color.red.opacity(0.15)
                                : Color.clear
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            withAnimation {
                                deleteItem(item)
                            }
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }

                Spacer()
            }
            .listStyle(.plain)
            .padding()
            .navigationTitle("Groceries")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddItem = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }

        }
        .sheet(isPresented: $showingAddItem) {
            GroceryInputView()
        }
    }

    func deleteItem(_ item: GroceryItem) {
        modelContext.delete(item)
    }

    func showInputView() {
        showingAddItem = true
    }
}

#Preview {
    ChoreListView()
        .modelContainer(PreviewContainer.chores)
}
