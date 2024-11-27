import Foundation

struct Policy: Codable, Identifiable {
    let id: String
    let type: String
    let premium: Int
    
    var iconName: String {
        switch type.lowercased() {
        case "home":
            return "house.fill"
        case "auto":
            return "car.fill"
        case "health":
            return "heart.fill"
        default:
            return "questionmark.circle.fill"
        }
    }
}
