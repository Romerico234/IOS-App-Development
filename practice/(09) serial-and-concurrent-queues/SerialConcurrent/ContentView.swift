import SwiftUI

struct ContentView: View {
    @State private var serialQueueResult = "Serial Queue Task Result:"
    @State private var concurrentQueueResult = "Concurrent Queue Task Result:"

    var body: some View {
        VStack {
            Text(serialQueueResult)
                .padding()
            Text(concurrentQueueResult)
                .padding()
            Button("Start Tasks") {
                runSerialQueueTasks()
                runConcurrentQueueTasks()
            }
            .padding()
        }
    }

    func runSerialQueueTasks() {
        // Default is serial
        // DispatchQueue are defaulted to global queues
        let serialQueue = DispatchQueue(label: "com.example.serialQueue")

        for i in 1...5 {
            serialQueue.async {
                Thread.sleep(forTimeInterval: 1) // Simulating a long-running task
                DispatchQueue.main.async {
                    serialQueueResult += " \(i)"
                }
            }
        }
    }

    func runConcurrentQueueTasks() {
        // DispatchQueue are defaulted to global queues
        let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

        for i in 1...5 {
            concurrentQueue.async {
                Thread.sleep(forTimeInterval: 1) // Simulating a long-running task
                DispatchQueue.main.async {
                    concurrentQueueResult += " \(i)"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
