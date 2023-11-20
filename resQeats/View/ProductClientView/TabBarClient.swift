//
//  TabBarClient.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
struct TabBarClient: View {
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            FoodCartView()
                .tabItem{
                    Label("Cart", systemImage: "cart")
                }
            ClientOrderView()
                .tabItem{
                    Label("Order", systemImage: "checkmark")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
            
        }
    }
}

struct TabBarClient_Previews: PreviewProvider {
    static var previews: some View {
        TabBarClient()
    }
}


