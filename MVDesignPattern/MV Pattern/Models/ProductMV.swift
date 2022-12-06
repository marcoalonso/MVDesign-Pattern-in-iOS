//
//  Product.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 05/12/22.
//

import Foundation

struct ProductMV: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
