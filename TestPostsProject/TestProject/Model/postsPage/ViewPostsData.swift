//
//  updatedPublicPostsData.swift
//  TestProject
//
//  Created by M_934098 on 7/26/21.
//

import Foundation

//struct PostsResponse: Codable {
//    let postsResponse : [PostsData]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case postsResponse = "postsResponse"
//    }
//    // All your properties should be included
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        postsResponse = try values.decodeIfPresent([PostsData].self, forKey: .postsResponse)
//    }
//}

// MARK: - PublicPosts
struct PostsData: Codable {
    let content: [PostsContent]?
    let pageable: Pageable?
    let totalElements: Int?
    let totalPages: Int?
    let last: Bool?
    let sort: [Sort]?
    let numberOfElements: Int?
    let first: Bool?
    let size: Int?
    let number: Int?
    let empty: Bool?

    enum CodingKeys: String, CodingKey {
        case content = "content"
        case pageable = "Pageable"
        case totalElements = "totalElements"
        case totalPages = "totalPages"
        case last = "last"
        case sort = "sort"
        case numberOfElements = "numberOfElements"
        case first = "first"
        case size = "size"
        case number = "number"
        case empty = "empty"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        content = try values.decodeIfPresent([PostsContent].self, forKey: .content)
        pageable = try values.decodeIfPresent(Pageable.self, forKey: .pageable)
        totalElements = try values.decodeIfPresent(Int.self, forKey: .totalElements)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        last = try values.decodeIfPresent(Bool.self, forKey: .last)
        sort = try values.decodeIfPresent([Sort].self, forKey: .sort)
        numberOfElements = try values.decodeIfPresent(Int.self, forKey: .numberOfElements)
        first = try values.decodeIfPresent(Bool.self, forKey: .first)
        size = try values.decodeIfPresent(Int.self, forKey: .size)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        empty = try values.decodeIfPresent(Bool.self, forKey: .empty)
    }
}
    

// MARK: - PublicPostsContent
struct PostsContent: Codable {
    let createdOn: String?
    let id: Int?
    let author: Author?
    let message: String?
    let imageURL: String?
    let comments: Comments?
    let likeCount: Int?
    let hasLiked: Bool?
    
    enum CodingKeys: String, CodingKey {
        case createdOn = "createdOn"
        case id = "id"
        case author = "author"
        case message = "message"
        case imageURL = "imageUrl"
        case comments = "comments"
        case likeCount = "likeCount"
        case hasLiked = "hasLiked"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdOn = try values.decodeIfPresent(String.self, forKey: .createdOn)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        author = try values.decodeIfPresent(Author.self, forKey: .author)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        comments = try values.decodeIfPresent(Comments.self, forKey: .comments)
        likeCount = try values.decodeIfPresent(Int.self, forKey: .likeCount)
        hasLiked = try values.decodeIfPresent(Bool.self, forKey: .hasLiked)
        
    }
}

// MARK: - Author
struct Author: Codable {
    let id: Int?
    let username: String?
    let profileImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case profileImageURL = "profileImageUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        profileImageURL = try values.decodeIfPresent(String.self, forKey: .profileImageURL)
    }
}

// MARK: - Comments
struct Comments: Codable {
    let content: [CommentsContent]?
    let pageable: Pageable?
    let totalElements: Int?
    let totalPages: Int?
    let last: Bool?
    let sort: Sort?
    let numberOfElements: Int?
    let first: Bool?
    let size: Int?
    let number: Int?
    let empty: Bool?
}

// MARK: - CommentsContent
struct CommentsContent: Codable {
    let createdOn: String?
    let id: Int?
    let postID: Int?
    let author: Author?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case createdOn = "createdOn"
        case id = "id"
        case postID = "postID"
        case author = "author"
        case message = "message"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdOn = try values.decodeIfPresent(String.self, forKey: .createdOn)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        postID = try values.decodeIfPresent(Int.self, forKey: .postID)
        author = try values.decodeIfPresent(Author.self, forKey: .author)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }
}

// MARK: - Pageable
struct Pageable: Codable {
    let sort: [Sort]
    let pageNumber: Int
    let pageSize: Int
    let offset: Int
    let paged: Bool
    let unpaged: Bool
}

// MARK: - Sort
struct Sort: Codable {
    let unsorted: Bool
    let sorted: Bool
    let empty: Bool
}
