//
//  TabBarOrganisation.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct TabBarOrganisation: View {
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            SupplierDonnationView()
                .tabItem{
                    Label("Donnation", systemImage: "heart.circle.fill")
                }
            AskForDonationView()
                .tabItem{
                    Label("New", systemImage: "plus")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBarOrganisation_Previews: PreviewProvider {
    static var previews: some View {
        TabBarOrganisation()
    }
}
