import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
//            LiquidDownloadButton()
            //AnimatedGradientBackground()
            //ShimmerEffect()
//            CustomGridExample()
            //DraggableCardExample()
            //CustomScrollIndicatorExample()
//            Rotation3DExample()
            //ParallaxScrollingExample()
//            CustomTabBarExample()
            Button("Show Alert") {
                showAlert = true
            }
        }
        .customAlert(isPresented: $showAlert)
    }
}

struct CustomAlertModifier: ViewModifier {
    @Binding var isPresented: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 10)
                    .frame(width: 200, height: 100)
                    .overlay(Text("Custom Alert"))
            }
        }
    }
}

extension View {
    func customAlert(isPresented: Binding<Bool>) -> some View {
        modifier(CustomAlertModifier(isPresented: isPresented))
    }
}

struct CustomTabBarExample: View {
    @Namespace private var tabAnimation
    @State private var selectedTab = "Home"

    let tabs = ["Home", "Search", "Profile"]

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    VStack {
                        Text(tab)
                            .fontWeight(selectedTab == tab ? .bold : .regular)
                        if selectedTab == tab {
                            Color.blue
                                .frame(height: 2)
                                .matchedGeometryEffect(id: "tab", in: tabAnimation)
                        } else {
                            Color.clear.frame(height: 2)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ParallaxScrollingExample: View {
    var body: some View {
        ScrollView {
            GeometryReader { geo in
                Image("test")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .offset(y: -geo.frame(in: .global).minY * 0.5) // Adjust for slower scrolling
            }
            .frame(height: 400)

            VStack {
                ForEach(1...50, id: \.self) { i in
                    Text("Row \(i)")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                }
            }
        }
    }
}

struct Rotation3DExample: View {
    @State private var angle: CGFloat = 0

    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
                .rotation3DEffect(
                    .degrees(Double(angle)),
                    axis: (x: 1, y: 0, z: 0)
                )
                .gesture(
                    DragGesture().onChanged { value in
                        angle = value.translation.height
                    }
                )
            Text("Drag to Rotate")
        }
    }
}

struct CustomScrollIndicatorExample: View {
    let items = Array(1...50)
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(items, id: \.self) { item in
                        Text("Item \(item)")
                            .padding()
                    }
                }
                .background(
                    GeometryReader { innerGeo in
                        Color.clear
                            .onChange(of: innerGeo.frame(in: .global).minY) { newValue, oldValue in
                                scrollOffset = newValue
                            }
                    }
                )
                
            }
            VStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 5, height: geometry.size.height * 0.3)
                    .offset(y: scrollOffset * 0.1)
            }
            .frame(width: 5)
        }
    }
}

struct DraggableCardExample: View {
    @State private var offset: CGSize = .zero

    var body: some View {
        VStack {
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(height: 200)
                .offset(y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation
                        }
                        .onEnded { _ in
                            if offset.height > 100 {
                                offset = CGSize(width: 0, height: 800) // dismiss
                            } else {
                                offset = .zero
                            }
                        }
                )
        }
    }
}

struct CustomGridExample: View {
    let items = Array(1...20)

    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: 80))
        ]

        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    Text("\(item)")
                        .frame(width: 80, height: 80)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
        }
    }
}

struct ShimmerEffect: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    .clear,
                    .white.opacity(0.5),
                    .clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .mask(Rectangle())
            .offset(x: isAnimating ? 400 : -400)
            .onAppear {
                withAnimation(
                    Animation
                        .linear(duration: 2)
                        .repeatForever(autoreverses: false)
                ) {
                    isAnimating = true
                }
            }
        }
        .frame(height: 100)
        .cornerRadius(8)
    }
}

struct AnimatedGradientBackground: View {
    @State private var start = UnitPoint(x: 0, y: 0)
    @State private var end = UnitPoint(x: 1, y: 1)
    
    let gradient = LinearGradient(
        colors: [.blue, .purple, .pink],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        gradient
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.linear(duration: 3).repeatForever(autoreverses: true)) {
                    start = UnitPoint(x: 1, y: 1)
                    end = UnitPoint(x: 0, y: 0)
                }
            }
    }
}

struct LiquidDownloadButton: View {
    @State private var downloadProgress: CGFloat = 0
    @State private var isDownloading = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(width: isDownloading ? 50 : 200, height: 50)
            
            if isDownloading {
                Circle()
                    .trim(from: 0, to: downloadProgress)
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(-90))
            } else {
                Text("Download")
                    .foregroundColor(.white)
            }
        }
        .animation(.spring(), value: isDownloading)
        .onTapGesture {
            isDownloading = true
            withAnimation(.linear(duration: 2)) {
                downloadProgress = 1
            }
        }
    }
}






#Preview {
    ContentView()
}
