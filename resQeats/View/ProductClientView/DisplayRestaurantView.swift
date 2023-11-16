//
//  DisplayRestaurantView.swift
//  resQeats
//
//  Created by rania hm on 16/11/2023.
//

import Foundation
import SwiftUI

struct Restaurant: Identifiable, Decodable {
    var id = UUID()
    var name: String
    var category: String
    var imageName: String
    var description: String
    var foodOffers: [FoodOffer]
    var fournisseurType: String
    var fournisseurWorkHours: String
    var fournisseurImage: String
}

struct RestaurantListView: View {
    @State private var restaurants: [Restaurant] = []

    var body: some View {
        List(restaurants) { restaurant in
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.title)
                Text("Category: \(restaurant.category)")
                Text("Description: \(restaurant.description)")
                // Afficher d'autres détails du restaurant...

                Text("Fournisseur:")
                Text("Type: \(restaurant.fournisseurType)")
                Text("Work Hours: \(restaurant.fournisseurWorkHours)")
                // Afficher d'autres détails du fournisseur...
            }
        }
        .onAppear(perform: loadData)
    }

    func loadData() {
        guard let url = URL(string: "http://172.18.32.60:5005/fournisseur/fournisseurs") else {
            print("URL invalide")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Erreur de chargement des restaurants: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    restaurants = try decoder.decode([Restaurant].self, from: data)
                } catch {
                    print("Erreur de décodage des données: \(error.localizedDescription)")
                    print("Données reçues: \(String(data: data, encoding: .utf8) ?? "Impossible de convertir en chaîne.")")
                }
            }
        }.resume()
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
