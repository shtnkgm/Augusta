//
//  CommentsEntity.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

struct CommentsEntity {
    let comments: [Comment]
    
    struct Comment {
        let postId: Int
        let id: Int
        let name: String
        let email: String
        let body: String
    }
}

extension CommentsEntity: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let comments = try container.decode([Comment].self)
        self.comments = comments
    }
}
extension CommentsEntity.Comment: Decodable {}
