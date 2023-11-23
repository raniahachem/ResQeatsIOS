//
//  ProductView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI
/*struct ProductView: View {

    @ObservedObject var viewModel: ProductViewModel
    //var restaurantName: String
    //@StateObject private var cartManager = CartManager()
    @EnvironmentObject var cartManager: CartManager

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack {
                //Text("Latest offers posted by \(restaurantName)")
                Text("Latest offers posted")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products, id: \._id) { product in
                        NavigationLink(destination: FoodDetail(product: product, viewModel: viewModel)) {
                            ProductCardView(product: product)
                        }
                    }
                }
                .padding()
            }
        }
    }
}*/

/*struct ProductView: View {
    @ObservedObject var productViewModel = ProductViewModel()
    let restaurantId: String

    var body: some View {
        List(productViewModel.products, id: \._id) { product in
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("Price: \(product.price) TND")
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            self.productViewModel.getProductsByRestaurantId(restaurantId: restaurantId)
        }
    }
}*/


struct ProductView: View {

    @ObservedObject var viewModel: ProductViewModel
    //var restaurantName: String
    //@StateObject private var cartManager = CartManager()
    @EnvironmentObject var cartManager: CartManager

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    let restaurantId: String

    var body: some View {
        ScrollView {
            VStack {
                //Text("Latest offers posted by \(restaurantName)")
                Text("Latest offers posted")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products, id: \._id) { product in
                        NavigationLink(destination: FoodDetail(product: product, viewModel: viewModel)) {
                            ProductCardView(product: product)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            self.viewModel.getProductsByRestaurantId(restaurantId: restaurantId)
        }
    }
}
