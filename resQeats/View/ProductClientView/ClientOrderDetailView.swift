//
//  ClientOrderDetailView.swift
//  resQeats
//
//  Created by rania hm on 20/11/2023.
//

import SwiftUI

struct ClientOrderDetailView: View {
    var order: Order

    var body: some View {
        VStack {
            Text("Order Details")
                .font(.title)
                .padding()

            Text("Order Number: \(order.orderNumber)")
                .padding()
            Text("Status: \(order.status.rawValue)")
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                ForEach(order.items, id: \._id) { product in
                    HStack {
                        Text("\(product.quantity) x \(product.title)")
                        Spacer()
                        Text("\(product.price) TND")
                    }
                }
            }
            .padding()

            Text("Total Amount: \(order.totalAmount) TND")
                .bold()
                .padding()

            Spacer()
        }
        .navigationTitle("Order #\(order.orderNumber)")
    }
}

