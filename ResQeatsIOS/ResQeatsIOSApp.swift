//
//  ResQeatsIOSApp.swift
//  ResQeatsIOS
//
//  Created by rania hm on 15/11/2023.
//

import SwiftUI

/*@main
struct ResQeatsIOSApp: App {
    let persistenceController = PersistenceController.shared
 @StateObject private var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
           ClientView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
 .environmentObject(cartManager)
        }
    }
}*/


@main
struct ResQeatsIOSApp: App {
    //@StateObject var cartManager = CartManager() // Déclarer CartManager comme @StateObject
    @StateObject private var cartManager = CartManager()
    @StateObject var productViewModel = ProductViewModel()


    var body: some Scene {
        WindowGroup {
           ClientView()
                .environmentObject(cartManager)
                .environmentObject(productViewModel)// Injectez l'instance de CartManager dans l'environnement
        }
    }
}
