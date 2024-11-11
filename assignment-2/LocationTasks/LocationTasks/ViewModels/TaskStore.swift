//
//  TaskStore.swift
//  LocationTasks
//
//  Created by Romerico David on 11/10/24.
//
import Foundation

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []

    private let tasksKey = "tasks"

    init() {
        loadTasks()
    }

    func addTask(_ task: Task) {
        tasks.append(task)
        saveTasks()
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    private func saveTasks() {
        if let data = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: tasksKey)
        }
    }

    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = savedTasks
        }
    }
}
