import SwiftUI

struct ContentView: View {
    let urlString = "https://www.jalirani.com/img/flave.png"
    var body: some View {
        VStack {
            RemoteImage(url: urlString)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(10)
            // Try loading Async image in a list to compare
        }
    }
}

extension ContentView {
    class ImageCache {
        static let shared = ImageCache()

        private let cache = NSCache<NSString, UIImage>()

        private init() {}

        func set(_ image: UIImage, forKey key: String) {
            cache.setObject(image, forKey: key as NSString)
        }

        func get(forKey key: String) -> UIImage? {
            return cache.object(forKey: key as NSString)
        }
    }
    
    class ImageLoader: ObservableObject {
        @Published var image: UIImage?

        private var url: String
        private var task: URLSessionDataTask?

        init(url: String) {
            self.url = url
            loadImage()
        }

        private func loadImage() {
            let imageCache = ContentView.ImageCache.shared
            if let cachedImage = imageCache.get(forKey: url) {
                self.image = cachedImage
                return
            }

            guard let url = URL(string: url) else { return }

            task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.image = image
                    imageCache.set(image!, forKey: self.url)
                }
            }
            task?.resume()
        }
    }
    
    struct RemoteImage: View {
        @ObservedObject var imageLoader: ImageLoader

        init(url: String) {
            imageLoader = ImageLoader(url: url)
        }

        var body: some View {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                ProgressView()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
