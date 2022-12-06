//
//  ContentView.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 30/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel : StoreModel
    
    @StateObject private var vm = ProductListViewModel(webservice: WebService())
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print("Debug: error \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        //MVVM Pattern
        
//        List(vm.products) { product in
//            HStack {
//                AsyncImage(url: URL(string: product.image)) { image in
//                    image.resizable()
//                        .frame(maxWidth: 30, maxHeight: 40)
//                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
//                } placeholder: {
//                    ProgressView()
//                }.padding()
//                VStack {
//                    Text(product.title)
//                        .font(.title)
//                        .foregroundColor(.blue)
//                    Text("$ \(String(format: "%.2f", product.price))")
//                        .foregroundColor(.green)
//                        .font(.title2)
//                        .fontWeight(.bold)
//                    Text(product.description)
//                        .font(.footnote)
//                }
//            }
//        }.task {
//            await vm.populateProducts()
//        }
        
        //MVPattern
        
        VStack {
            List (storeModel.products) { product in
                Text(product.title)
            }
        }.task {
            await populateProducts()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StoreModel(webservice: WebServiceMV()))
    }
}
