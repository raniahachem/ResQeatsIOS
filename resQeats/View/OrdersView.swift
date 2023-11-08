//
//  OrdersView.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        List {
            ForEach(orders) { order in
                OrderRow(order: order)
            }
        }
    }
}

struct OrderRow: View {
    var order: Order

    var body: some View {
        VStack {
            Text("Commande \(order.id)")
                .font(.title)
            Text("Date: \(order.date)")
                .font(.subheadline)
            Text("Total: \(order.totalPrice) €")
                .font(.subheadline)
            Text("Statut: \(order.status)")
                .font(.subheadline)
            HStack {
                Button("Accepter") {
                    // Action pour accepter la commande
                }
                Button("Refuser") {
                    // Action pour refuser la commande
                }
            }
            // Vous pouvez ajouter d'autres détails de la commande ici
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}

struct Order: Identifiable {
    var id = UUID()
    var date: String
    var totalPrice: Double
    var status: String
    // Ajoutez d'autres attributs de commande ici

    // Si vous voulez définir un statut par défaut en attente, vous pouvez utiliser une initialisation
    init(date: String, totalPrice: Double, status: String = "En attente") {
        self.date = date
        self.totalPrice = totalPrice
        self.status = status
    }
}

var orders = [
    Order(date: "2023-11-01", totalPrice: 25.99),
    Order(date: "2023-11-02", totalPrice: 15.49),
    // Ajoutez d'autres commandes ici
]

