//
//  ContentView.swift
//  To-Do List
//
//  Created by Jonathan Varghese on 1/25/24.
//

import SwiftUI
struct ContentView: View {
    @State private var toDoItems =
    [ToDoItem(priority:"High", description:"Take out trash", dueDate:Date()),
     ToDoItem(priority:"Medium", description:"Pick up clothes", dueDate:Date()),
     ToDoItem(priority:"Low", description:"Eat a donut", dueDate:Date())]
    
    var body: some View {
        NavigationView {
            List {
                ForEach (toDoItems) {thing in
                    Text(toDoItems.description)
                }
                .onMove { indices, newOffset in
                    toDoItems.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { IndexSet in
                    toDoItems.remove(atOffsets: IndexSet)
                }
            }
            .navigationBarTitle("To Do List", displayMode: .inline)
            .navigationBarItems(leading:EditButton())
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ToDoItem: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
}
