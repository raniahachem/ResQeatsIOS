//
//  ClientOrderView.swift
//  resQeats
//
//  Created by rania hm on 20/11/2023.
//

import SwiftUI

struct ClientOrderView: View {
    @State private var orders: [Order] = []  // Replace this with your actual data source
    
    var body: some View {
        
            NavigationView {
                ZStack {
                    Color("Background")
                        .ignoresSafeArea()
                VStack {
                    if orders.isEmpty {
                        Text("You haven't placed any orders yet.")
                            .foregroundColor(.gray)
                            .padding()
                            .font(.headline)
                    } else {
                        // Display orders for the client
                        List(orders, id: \._id) { order in
                            NavigationLink(
                                destination: ClientOrderDetailView(order: order)
                            ) {
                                ClientOrderRow(order: order)
                            }
                        }
                    }
                }
                .navigationTitle("My recent orders")
            }
        }
    }
}

struct ClientOrderRow: View {
    var order: Order

    var body: some View {
        HStack(spacing: 20) {
            Text("Order #\(order.orderNumber)")
                .bold()

            Spacer()

            Text(order.status.rawValue)
                .foregroundColor(order.status == .accepted ? .green : .orange)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

