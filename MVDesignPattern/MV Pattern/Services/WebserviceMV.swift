//
//  Webservice.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 05/12/22.
//

import Foundation

class WebServiceMV {
    func getProducts() async throws -> [ProductMV] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let products = try? JSONDecoder().decode([ProductMV].self, from: data) else {
            throw NetworkError.decodignError
        }
        
        return products
    }
}
