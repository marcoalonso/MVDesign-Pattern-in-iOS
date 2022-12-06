//
//  ProductListViewModel.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 30/11/22.
//

import Foundation

@MainActor
class ProductListViewModel: ObservableObject {
    
    @Published var products : [ProductViewModel] = []
    
    let webservice : WebService
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    func populateProducts() async {
        do {
            let products = try await webservice.getProducts()
            self.products = products.map(ProductViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct ProductViewModel: Identifiable {
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
    var image: String {
        product.image
    }
    
    var description: String {
        product.description
    }
}
