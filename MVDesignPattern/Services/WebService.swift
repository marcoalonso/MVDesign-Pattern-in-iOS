//
//  WebService.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 30/11/22.
//

import Foundation
enum NetworkError: Error {
    case badURL
    case badRequest
    case decodignError
}

class WebService {
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([Product].self, from: data) else {
            throw NetworkError.decodignError
        }
        
        return products
    }
}
