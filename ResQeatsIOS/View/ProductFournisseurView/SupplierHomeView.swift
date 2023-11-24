//
//  SupplierHome.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct SupplierHomeView: View {
    @StateObject private var cartManager = CartManager()
    @StateObject private var productViewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView {
                    ProductSupplierView(viewModel: productViewModel)
                        .environmentObject(cartManager)
                }
                .navigationTitle("My offers")
            }
            .navigationViewStyle(.stack)
        }
    }
}
struct SupplierOffers: View {
    @ObservedObject var viewModel: ProductViewModel
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            VStack {
                //let filteredOffers = $viewModel.restaurant.foodOffers.filter { $0.restaurantName == "Le zink" }
                HStack{
                Text("offers posted")
                                    .font(.headline)
                                    .fontWeight(.medium)
                                    .padding(.leading, 16)
                                    .opacity(0.7)
                                    
                    Spacer()
                    NavigationLink(destination: AddOfferView()) {
                        Image(systemName: "plus.circle.fill")
                            .padding(.trailing, 16.0)
                                .font(.system(size: 40))
                                .foregroundColor(Color("GreenforB"))
                        }
                }
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products, id: \._id) { product in
                        NavigationLink(destination: FoodDetail(product: product, viewModel: viewModel)) {
                            SupplierOfferCardView(product: product)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct SupplierOfferCardView: View {
    var product: Product

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 3)

            VStack {
                Image(product.image)
                    .resizable()
                    .frame(height: 150)
                    .cornerRadius(10)

                Text(product.title)
                    .font(.headline)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                Spacer()
                HStack {
                    Text(product.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("\(product.price) TND")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}
