//
//  PostsRepository.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

protocol PostsRepository {
    func fetch() async throws -> PostsEntity
}

struct PostsRepositoryImpl: PostsRepository {
    let apiClient: APIClient
    
    func fetch() async throws -> PostsEntity {
        try await apiClient.fetch(endPoint: "https://jsonplaceholder.typicode.com/posts")
    }
}
