//
//  TodoListApp.swift
//  TodoList
//
//  Created by Emirhan Zeyrek on 3.05.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
