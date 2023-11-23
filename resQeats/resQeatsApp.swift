//
//  resQeatsApp.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 07/11/2023.
//

import SwiftUI

@main
struct resQeatsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Profile()
            
        }
    }
}
