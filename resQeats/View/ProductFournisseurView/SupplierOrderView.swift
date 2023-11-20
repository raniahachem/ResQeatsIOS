//
//  SupplierOrderView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct SupplierOrderView: View {
    @State private var orders: [Order] = [sampleOrder()]  // Replace this with your actual data source

    var body: some View {
        NavigationView {
            VStack {
                if orders.isEmpty {
                    Text("You have no orders received yet.")
                        .foregroundColor(.gray)
                        .padding()
                        .font(.headline)
                } else {
                    List(orders, id: \.id) { order in
                        NavigationLink(
                            destination: SupplierOrderDetailView(
                                order: order,
                                acceptAction: {
                                    // Supplier-specific logic for accepting an order
                                    self.acceptOrder(order)
                                },
                                declineAction: {
                                    // Supplier-specific logic for declining an order
                                    self.declineOrder(order)
                                }
                            )
                        ) {
                            SupplierOrderRow(order: order)
                        }
                    }
                }
            }
            .navigationTitle("Recieved Orders")
        }
    }

    func acceptOrder(_ order: Order) {
        // Supplier-specific logic for accepting an order
        print("Order accepted by the restaurant")
        // Update order status and refresh the view
        updateOrderStatus(order, newStatus: .accepted)
    }

    func declineOrder(_ order: Order) {
        // Supplier-specific logic for declining an order
        print("Order declined by the restaurant")
        // Update order status and refresh the view
        updateOrderStatus(order, newStatus: .declined)
    }

    func updateOrderStatus(_ order: Order, newStatus: Order.OrderStatus) {
        if let index = orders.firstIndex(where: { $0.id == order.id }) {
            orders[index].status = newStatus
        }
    }
}

struct SupplierOrderRow: View {
    var order: Order

    var body: some View {
        HStack(spacing: 20) {
            Text("Order #\(order.orderNumber)")
                .bold()

            Spacer()

            Text(order.status.rawValue)
                .foregroundColor(order.status == .accepted ? .green : .orange)

            // Additional buttons or actions for the supplier
            /*Button("Accept") {
                // Supplier-specific logic for accepting an order
            }
            .foregroundColor(.green)
            .padding(.trailing, 10)

            Button("Decline") {
                // Supplier-specific logic for declining an order
            }
            .foregroundColor(.red)*/
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SupplierOrderView_Previews: PreviewProvider {
    static var previews: some View {
        SupplierOrderView()
    }
}

func sampleOrder() -> Order {
    let foodOffer = FoodOffer(
        title: "Sample Food",
        category: .fastFood,
        description: "A delicious sample food",
        price: 10,
        image: "sample_food",
        quantity: 1,
        restaurantName: "Sample Restaurant"
    )

    let orderData: [String: Any] = [
        "id": UUID().uuidString,
        "status": "pending",
        "items": [foodOffer],
        "totalAmount": 10,
        "orderNumber": UUID().uuidString.prefix(8).uppercased()
    ]

    do {
        let jsonData = try JSONSerialization.data(withJSONObject: orderData, options: [])
        let decoder = JSONDecoder()
        let order = try decoder.decode(Order.self, from: jsonData)
        return order
    } catch {
        // Handle error
        fatalError("Error creating sample order: \(error)")
    }
}

