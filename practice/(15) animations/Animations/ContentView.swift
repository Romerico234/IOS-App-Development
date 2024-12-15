import SwiftUI

struct ContentView: View {

    @State private var isExpanded = false

    var body: some View {
        VStack {
            //AccessibleView()
            //CustomDrawing()
            //ShapeAnimation()
            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            if isExpanded {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green)
                    .frame(height: 200)
                    .transition(.scale)
            }
        }
    }
}

struct ShapeAnimation: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(Color.blue, lineWidth: 5)
            .rotationEffect(.degrees(-90))
            .frame(width: 100, height: 100)
            .onAppear {
                withAnimation(.easeInOut(duration: 5)) {
                    progress = 1.0
                }
            }
    }
}

struct CustomDrawing: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: size.width, y: size.height))
                },
                with: .color(.blue),
                lineWidth: 3
            )
        }
        .frame(width: 200, height: 200)
    }
}

struct AccessibleView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .accessibilityLabel("Greeting Message")
            Image(systemName: "star")
                .accessibilityLabel("Star Icon")
        }
    }
}

#Preview {
    ContentView()
}
