//
//  resQeatsApp.swift
//  resQeats
//
//  Created by rania hm on 6/11/2023.
//

/*import SwiftUI

@main
struct resQeatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(cart: CartModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}*/


/*import SwiftUI
@main
struct resQeatsApp: App {
    @StateObject var cartManager = CartManager() // Déclarer CartManager comme @StateObject

    var body: some Scene {
        WindowGroup {
            SupplierView()
                .environmentObject(cartManager) // Injectez l'instance de CartManager dans l'environnement
        }
    }
}*/

import SwiftUI
@main
struct resQeatsApp: App {
    @StateObject var cartManager = CartManager() // Déclarer CartManager comme @StateObject

    var body: some Scene {
        WindowGroup {
            HomeScreen2View()
                .environmentObject(cartManager) // Injectez l'instance de CartManager dans l'environnement
        }
    }
}
