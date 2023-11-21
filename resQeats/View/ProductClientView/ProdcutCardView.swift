//
//  ProdcutCardView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI

    struct ProductCardView: View {
        let product: Product
       

        var body: some View {
            VStack {
                Image(product.title)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 100)
                    .cornerRadius(10)

                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.blue)
                    .padding(.top, 4)
                

                HStack {
                    Spacer()
                    Text("\(product.price) TND")
                        .font(.caption)
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                }
            }
            .frame(width: 150, height: 180)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 2)
            
        }
    }

    struct ProductCardView_Previews: PreviewProvider {
        static var pl = ProductViewModel()
        static var previews: some View {
            ProductCardView(product: pl.products.first!)
        }
    }

