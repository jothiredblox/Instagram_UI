import Foundation

// MARK: - User Model
struct User: Identifiable, Codable {
    var id: Int
    var name: String
    var online: Bool
    var picture: Picture
    var posts: [Post]?
    var comments: [Comment]?
}

// MARK: - Picture Model
struct Picture: Codable {
    var imageUrl: [Int]
}

// MARK: - Post Model
struct Post: Identifiable, Codable {
    var id: Int
    var content: String
    var userId: Int
    var comments: [Comment]?
}

// MARK: - Comment Model
struct Comment: Identifiable, Codable {
    var id: Int
    var text: String
    var postId: Int
}
