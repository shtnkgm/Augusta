//
//  APIClient.swift
//  Augusta
//
//  Created by Shota Nakagami on 2021/09/22.
//

import Foundation

protocol APIClient {
    func fetch<Entity: Decodable>(endPoint: String) async throws -> Entity
}

struct APIClientImpl: APIClient {
    func fetch<Entity: Decodable>(endPoint: String) async throws -> Entity{
        let request = URLRequest(url: URL(string: endPoint)!)
        let result = try await URLSession.shared.data(for: request)
        if let httpURLResponse = result.1 as? HTTPURLResponse, httpURLResponse.statusCode != 200 {
            print("statusCode: \(httpURLResponse.statusCode)")
            throw NSError(domain: "HTTP Error", code: 0)
        }
        return try JSONDecoder().decode(Entity.self, from: result.0)
    }
}
