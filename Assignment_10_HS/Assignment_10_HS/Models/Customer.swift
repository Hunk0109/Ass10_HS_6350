import Foundation

struct Customer: Identifiable, Codable {
    let id: String
    var name: String
    var age: Int
    var profilePictureURL: String
}

