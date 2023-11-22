//
//  OrderView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
/*struct SupplierOrderDetailView: View {
    var order: Order
    var acceptAction: () -> Void
    var declineAction: () -> Void

    @State private var showAlert = false

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Button("Accept") {
                    acceptAction()
                    showAlert = true
                }
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .padding()

                Button("Decline") {
                    declineAction()
                    showAlert = true
                }
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                .padding()

                Spacer()
            }

            Text("Order Details")
                .font(.title)
                .padding()

            Text("Order Number: \(order.orderNumber)")
                .padding()
            Text("Status: \(order.status.rawValue)")
                .padding()

            VStack(alignment: .leading, spacing: 10) {
                ForEach(order.items, id: \.product._id) { item in
                    HStack {
                        Text("\(item.quantity) x \(item.product.title)")
                        Spacer()
                        // Text("\(item.product.price) TND")
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding()

            Text("Total Amount: \(order.totalAmount) TND")
                .bold()
                .padding()

            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Order Status Updated"),
                message: Text("The order status has been updated."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Order #\(order.orderNumber)")
    }
}*/

/*struct SupplierOrderDetailView: View {
    var order: Order
    var acceptAction: () -> Void
    var declineAction: () -> Void

    @State private var showAlert = false

    var body: some View {
        VStack {
            HStack {
                Spacer()

                Button("Accept") {
                    acceptAction()
                    showAlert = true
                }
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(8)
                .padding()

                Button("Decline") {
                    declineAction()
                    showAlert = true
                }
                .frame(width: 100, height: 40)
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                .padding()

                Spacer()
            }

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
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Order Status Updated"),
                message: Text("The order status has been updated."),
                dismissButton: .default(Text("OK"))
            )
        }
        .navigationTitle("Order #\(order.orderNumber)")
    }
}*/




