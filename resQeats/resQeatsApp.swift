//
//  resQeatsApp.swift
//  resQeats
//
//  Created by rania hm on 6/11/2023.
//

import SwiftUI

@main
struct resQeatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(cart: CartModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
