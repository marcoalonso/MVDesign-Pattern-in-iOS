//
//  Product.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 30/11/22.
//

import Foundation

struct Product : Decodable {
    let id: Int
    let title: String
    let price: Double
    let image: String
    let description: String
}
