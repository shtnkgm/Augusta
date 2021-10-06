//
//  CommentsRepository.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

protocol CommentsRepository {
    func fetch() async throws -> CommentsEntity
}

struct CommentsRepositoryImpl: CommentsRepository {
    let apiClient: APIClient
    
    func fetch() async throws -> CommentsEntity {
        try await apiClient.fetch(endPoint: "https://jsonplaceholder.typicode.com/comments")
    }
}
