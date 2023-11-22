//
//  ProdcutCardView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    //@ObservedObject private var cartManager: CartManager
    //@StateObject private var cartManager = CartManager()
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 3)
            VStack {
                Image(product.title)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 100)
                    .cornerRadius(10)
                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                Spacer()
                
                HStack {
                    Spacer()
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("\(product.price) TND")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                }
            }
            .padding()
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
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
    
    
    
  
