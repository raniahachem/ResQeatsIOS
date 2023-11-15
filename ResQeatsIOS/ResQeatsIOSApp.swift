//
//  ResQeatsIOSApp.swift
//  ResQeatsIOS
//
//  Created by rania hm on 15/11/2023.
//

import SwiftUI

@main
struct ResQeatsIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
