//
//  SettingsView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                Text("settings")
                    .navigationTitle("Settings")
            }
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
