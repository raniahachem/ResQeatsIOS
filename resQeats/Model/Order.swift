//
//  Order.swift
//  resQeats
//
//  Created by rania hm on 20/11/2023.
//

import Foundation
struct Order: Identifiable, Decodable {
    var id = UUID()
    var status: OrderStatus = .pending
    var items: [FoodOffer]
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
        items = try container.decode([FoodOffer].self, forKey: .items)
        totalAmount = try container.decode(Int.self, forKey: .totalAmount)
        orderNumber = try container.decode(String.self, forKey: .orderNumber)

        let statusRaw = try container.decode(String.self, forKey: .statusRaw)
        status = OrderStatus(rawValue: statusRaw) ?? .pending
    }
}

