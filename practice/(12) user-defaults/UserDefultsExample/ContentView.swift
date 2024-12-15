import SwiftUI

struct ContentView: View {
    @ObservedObject var model: ResourcesModel
    var body: some View {
        HStack {
            List(1...model.maxVal,id:\.self) {
                i in Text("\(i)")
            }
            VStack {
                Button("Add") {
                    model.setMax(model.maxVal+1)
                }
                .padding()
                Text("\(model.data.a), \(model.data.b)")
                        .frame(width:100, height:50, alignment: .center)
                Button("Reset") { 
                    model.reset()
                }
            }
        }
    }
}
