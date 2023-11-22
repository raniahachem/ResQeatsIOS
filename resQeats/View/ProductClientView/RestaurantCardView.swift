//
//  RestaurantCardView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI

struct RestaurantCardView: View {
    let restaurant: Restaurant2
    let size: CGFloat
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        VStack {
            Image(restaurant.username)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(restaurant.username)
                .font(.title3)
                .fontWeight(.bold)

            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text(restaurant.category)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
