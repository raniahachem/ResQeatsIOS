//
//  FoodOffer.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//
import Foundation
struct FoodOffer: Identifiable {
    var id = UUID()
    var title: String
    var category: String
    var description: String
    var price: Double
    var image: String
    var isInCart: Bool = false
}

