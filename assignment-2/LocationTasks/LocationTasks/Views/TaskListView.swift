//
//  TaskListView.swift
//  LocationTasks
//
//  Created by Romerico David on 11/10/24.
//
import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskStore: TaskStore

    var body: some View {
        List {
            ForEach(taskStore.tasks) { task in
                VStack(alignment: .leading) {
                    Text(task.name)
                        .font(.headline)
                    Text(task.description)
                    Text("Due Date: \(task.dueDateFormatted)")
                    Text("Location: \(String(format: "%.4f", task.latitude)), \(String(format: "%.4f", task.longitude))")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
            .onDelete(perform: taskStore.deleteTask)
        }
        .navigationTitle("Tasks")
        .toolbar {
            EditButton()
        }
    }
}
