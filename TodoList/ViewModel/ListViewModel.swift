//
//  ListViewModel.swift
//  TodoList
//
//  Created by Emirhan Zeyrek on 4.05.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        self.items = saveItems
    }
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String) {
        let newItem = Item(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
