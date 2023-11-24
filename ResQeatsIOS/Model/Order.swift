//
//  Order.swift
//  resQeats
//
//  Created by rania hm on 20/11/2023.
//

/*import Foundation
import SwiftUI
struct Order: Codable {
    var _id: String
    var status: OrderStatus = .pending
    var items: [OrderItem]
    var totalAmount: Int
    var orderNumber: String

    enum OrderStatus: String, Codable {
        case pending, accepted, declined
    }

    init(id: String, status: OrderStatus, items: [OrderItem], totalAmount: Int, orderNumber: String) {
        self._id = id
        self.status = status
        self.items = items 
        self.totalAmount = totalAmount
        self.orderNumber = orderNumber
    }

    
    struct OrderItem: Codable {
            var product: Product
            var quantity: Int
            var _id: String
        }
}*/
struct Order: Codable {
    var _id: String
    var status: OrderStatus = .pending
    var items: [OrderItem]
    var totalAmount: Int
    var orderNumber: String

    enum OrderStatus: String, Codable {
        case pending, accepted, declined
    }

    init(id: String, status: OrderStatus, items: [OrderItem], totalAmount: Int, orderNumber: String) {
        self._id = id
        self.status = status
        self.items = items
        self.totalAmount = totalAmount
        self.orderNumber = orderNumber
    }

    struct OrderItem: Codable {
        var product: Product
        var quantity: Int
        var _id: String
    }
}



/*import SwiftUI
struct Order: Identifiable, Decodable {
    var id = UUID()
    var status: OrderStatus = .pending
    var items: [Product]
    var totalAmount: Int
    var orderNumber: String

    enum OrderStatus: String, Decodable {
        case pending, accepted, declined
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case items
        case totalAmount
        case orderNumber
        case statusRaw = "status"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        items = try container.decode([Product].self, forKey: .items)
        totalAmount = try container.decode(Int.self, forKey: .totalAmount)
        orderNumber = try container.decode(String.self, forKey: .orderNumber)

        let statusRaw = try container.decode(String.self, forKey: .statusRaw)
        status = OrderStatus(rawValue: statusRaw) ?? .pending
    }
}*/
