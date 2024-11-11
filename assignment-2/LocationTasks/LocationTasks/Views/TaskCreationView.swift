//
//  TaskCreationView.swift
//  LocationTasks
//
//  Created by Romerico David on 11/10/24.
//

import SwiftUI
import CoreLocation

struct TaskCreationView: View {
    @EnvironmentObject var taskStore: TaskStore
    @Environment(\.presentationMode) var presentationMode

    let coordinate: CLLocationCoordinate2D

    @State private var name = ""
    @State private var description = ""
    @State private var dueDate: Date? = nil
    @State private var showingDatePicker = false
    @State private var tempDueDate = Date()

    var isFormValid: Bool {
        !name.isEmpty && !description.isEmpty && dueDate != nil && dueDate! >= Calendar.current.startOfDay(for: Date())
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Name", text: $name)
                    TextField("Description", text: $description)
                    Button(action: {
                        // Initialize tempDueDate to dueDate or today if nil
                        if let dueDate = dueDate {
                            tempDueDate = dueDate
                        } else {
                            tempDueDate = Date()
                        }
                        showingDatePicker = true
                    }) {
                        HStack {
                            Text("Due Date")
                            Spacer()
                            if let dueDate = dueDate {
                                Text("\(dueDateFormatted(dueDate))")
                                    .foregroundColor(.secondary)
                            } else {
                                Text("Select")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Task")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Confirm") {
                    let task = Task(
                        name: name,
                        description: description,
                        dueDate: dueDate!,
                        coordinate: coordinate
                    )
                    taskStore.addTask(task)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(!isFormValid)
            )
            .sheet(isPresented: $showingDatePicker) {
                VStack {
                    DatePicker("Select Due Date", selection: $tempDueDate, in: Calendar.current.startOfDay(for: Date())..., displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .labelsHidden()
                        .padding()
                    Button("Done") {
                        dueDate = tempDueDate
                        showingDatePicker = false
                    }
                }
            }
        }
    }

    func dueDateFormatted(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
