//
//  ListRowView.swift
//  TodoList
//
//  Created by Emirhan Zeyrek on 4.05.2024.
//

import SwiftUI

struct ListRowView: View {
    let item: Item
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: Item(title: "This is the first title!", isCompleted: true))
}
