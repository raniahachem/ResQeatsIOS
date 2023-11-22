//
//  TabBarSupplier.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct TabBarSupplier: View {
    var body: some View {
        TabView{
            SupplierHomeView()
                .tabItem{
                    Label("Offers", systemImage: "house")
                }
            SupplierDonnationView()
                .tabItem{
                    Label("Donnation", systemImage: "heart.circle.fill")
                }
            
            AddOfferView()
                .tabItem{
                    Label("New", systemImage: "plus")
                }
            /*SupplierOrderView()
                .tabItem{
                    Label("Orders", systemImage: "checkmark")
                }*/
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBarSupplier_Previews: PreviewProvider {
    static var previews: some View {
        TabBarSupplier()
    }
}
