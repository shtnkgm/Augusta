//
//  PostsEntity.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

struct PostsEntity {
    let posts: [Post]
    
    struct Post {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }
}

extension PostsEntity: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let posts = try container.decode([Post].self)
        self.posts = posts
    }
}
extension PostsEntity.Post: Decodable {}
