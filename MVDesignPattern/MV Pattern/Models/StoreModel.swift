//
//  StoreModel.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 05/12/22.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let webservice : WebServiceMV
    @Published var products: [ProductMV] = []
    
    init(webservice : WebServiceMV) {
        self.webservice = webservice
    }
    
    func populateProducts() async {
        do {
            products = try await webservice.getProducts()
        } catch {
            print("Debug: error \(error.localizedDescription)")
        }
       
    }
}
