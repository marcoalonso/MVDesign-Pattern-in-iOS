//
//  MVDesignPatternApp.swift
//  MVDesignPattern
//
//  Created by Marco Alonso Rodriguez on 30/11/22.
//

import SwiftUI

@main
struct MVDesignPatternApp: App {
    //Injection
    @StateObject private var storeModel = StoreModel(webservice: WebServiceMV())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel) //storemodel será disponible en todas la vistas
        }
    }
}
