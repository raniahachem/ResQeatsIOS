//
//  ProductSupplierView.swift
//  resQeats
//
//  Created by rania hm on 22/11/2023.
//

import SwiftUI

struct ProductSupplierView: View {

    @ObservedObject var viewModel: ProductViewModel
    //var restaurantName: String
    //@StateObject private var cartManager = CartManager()
    @EnvironmentObject var cartManager: CartManager

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products, id: \._id) { product in
                        NavigationLink(destination: FoodDetail(product: product, viewModel: viewModel)) {
                            ProductCardSupplier(product: product)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
