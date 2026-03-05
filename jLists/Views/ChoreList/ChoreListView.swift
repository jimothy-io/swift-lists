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
        SortDescriptor(\ChoreItem.priorityValue, order: .reverse),
        SortDescriptor(\ChoreItem.name),
    ])
    var choreItems: [ChoreItem]

    @State private var showingAddItem: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(choreItems) { item in
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

                            Image(systemName: priorityIcon(item.priority))
                                .foregroundStyle(priorityColor(item.priority))
                                .frame(width: 20)

                            Text(item.name)
                                .foregroundStyle(
                                    item.isChecked ? .secondary : .primary
                                )
                                .fontWeight(
                                    priorityFontWeight(item.priority)
                                )
                                .strikethrough(item.isChecked)

                            Spacer()
                        }
                        .background(

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
            .navigationTitle("Chores")
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
            ChoreInputView()
        }
    }

    func deleteItem(_ item: ChoreItem) {
        modelContext.delete(item)
    }

    func showInputView() {
        showingAddItem = true
    }

    func priorityColor(_ priority: ChorePriority) -> Color {
        switch priority {
        case .low: return .secondary
        case .medium: return .orange
        case .high: return .red
        }
    }

    func priorityIcon(_ priority: ChorePriority) -> String {
        switch priority {
        case .low: return "chevron.down"
        case .medium: return "minus"
        case .high: return "chevron.up"
        }
    }

    func priorityFontWeight(_ priority: ChorePriority) -> Font.Weight {
        switch priority {
        case .low: return .light
        case .medium: return .regular
        case .high: return .semibold
        }
    }
}

#Preview {
    ChoreListView()
        .modelContainer(PreviewContainer.chores)
}
