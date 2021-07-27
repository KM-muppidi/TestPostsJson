////
////  PostsDataModel.swift
////
////  Created by Kavya Mangala muppidi on 7/20/21.
////
//
//struct PostsDataModel: Codable {
//    let postsDataModel : [PostsData]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case postsDataModel = "postsDataModel"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        postsDataModel = try values.decodeIfPresent([PostsData].self, forKey: .postsDataModel)
//    }
//}
//
//// MARK: - Posts
//struct PostsData: Codable {
//    let pageSize: Int?
//    let items: [PostsItem]?
//    let offset: Int?
//    let hasNext: Bool?
//    let totalCount: Int?
//}
//
//// MARK: - PostsItem
//struct PostsItem: Codable {
//    let post: Post?
//    let user: User?
//    let comments: [Comments]?
//}
//
//// MARK: - Comments
//struct Comments: Codable {
//    let pageSize: Int?
//    let items: [CommentsItem]?
//    let offset: Int?
//    let hasNext: Bool?
//    let totalCount: Int?
//}
//
//// MARK: - CommentsItem
//struct CommentsItem: Codable {
//    let id : String?
//    let username : String?
//    let content : String?
//    let timestamp: String?
//    let postId: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case username = "username"
//        case content = "content"
//        case timestamp = "timestamp"
//        case postId = "postId"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        content = try values.decodeIfPresent(String.self, forKey: .content)
//        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
//        postId = try values.decodeIfPresent(String.self, forKey: .postId)
//    }
//}
//
//// MARK: - Post
//struct Post: Codable {
//    let id : String?
//    let username : String?
//    let postDescription : String?
//    let timestamp: String?
//    let likes: Int?
//    let imageId: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case username = "username"
//        case postDescription = "description"
//        case timestamp = "timestamp"
//        case likes = "likes"
//        case imageId = "imageId"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        postDescription = try values.decodeIfPresent(String.self, forKey: .postDescription)
//        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
//        likes = try values.decodeIfPresent(Int.self, forKey: .likes)
//        imageId = try values.decodeIfPresent(String.self, forKey: .imageId)
//    }
//
//}
//
//// MARK: - User
//struct User: Codable {
//    let id : String
//    let username: String
//    let profileImage: String
//}
