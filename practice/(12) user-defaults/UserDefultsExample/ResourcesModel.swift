import Foundation

class ResourcesModel: ObservableObject {
    private let k: String = "max"
    private let k2: String = "data"
    @Published var maxVal: Int
    @Published var data: DataItem
    
    init() {
        maxVal = UserDefaults.standard.integer(forKey: k)
        if let di = UserDefaults.standard.getCodable(DataItem.self, forKey: k2) {
            data = di
        } else {
            data = DataItem(a: 0, b: 0.0)
        }
        
        if maxVal < 2 { maxVal = 5 }
        UserDefaults.standard.set(maxVal, forKey: k)
        try? UserDefaults.standard.setCodable(data, forKey: k2)
    }
    
    func setMax(_ v: Int) {
        if v > 1 {
            maxVal = v
            UserDefaults.standard.set(maxVal, forKey: k)
            data.a += maxVal
            data.b = 0.5 * Double(maxVal)
            try? UserDefaults.standard.setCodable(data, forKey: k2)
        }
    }
    func reset() {
        maxVal = 5 ; data.a = 0 ; data.b = 0.0
        UserDefaults.standard.removeObject(forKey: k)
        UserDefaults.standard.removeObject(forKey: k2)
    }
}


public extension UserDefaults {
    // do not name this function set!
    func setCodable<T: Codable>(_ object: T, forKey: String) throws {
        let jsonData: Data = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey)
    }
    
    func getCodable<T: Codable>(_ ot: T.Type, forKey: String) -> T? {
        guard let result = value(forKey: forKey) as? Data else { return nil }
        return try? JSONDecoder().decode(ot, from: result)
    }
}

struct DataItem: Codable {
    var a: Int
    var b: Double
}
