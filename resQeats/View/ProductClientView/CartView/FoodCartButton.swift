//
//  FoodCartButton.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct FoodCartButton: View {
    var numberOfOffers: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)

            if numberOfOffers > 0 {
                Text("\(numberOfOffers)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

struct FoodCartButton_Previews: PreviewProvider {
    static var previews: some View {
        FoodCartButton(numberOfOffers: 1)
    }
}
