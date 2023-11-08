//
//  ContentView.swift
//  resQeats
//
//  Created by rania hm on 6/11/2023.
//


import SwiftUI
import CoreData


struct ContentView: View {
    @ObservedObject var cart: CartModel
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        // Action pour sélectionner la localisation de l'utilisateur
                    }) {
                        Image(systemName: "mappin.circle")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    TextField("Rechercher...", text: $searchText)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(.systemGray2))
                                    .padding(10)
                            }
                        )

                    Spacer()

                    NavigationLink(destination: CartView(cart: cart)) {
                        Image(systemName: "cart")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("\(cart.items.count)")
                    }
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(foodCategories) { category in
                            CategoryView(category: category)
                        }
                    }
                }

                ListRestaurants()
            }.background(Color(hex: "F1FDDE"))
            .navigationBarTitle("Restaurants", displayMode: .inline)
        }
    }
}

struct CategoryView: View {
    var category: FoodCategory

    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(category.name)
                .font(.caption)
        }.background(Color(hex: "F1FDDE"))
    }
}


struct ListRestaurants: View {
    var body: some View {
        List {
            ForEach(restaurants, id: \.id) { restaurant in
                NavigationLink(destination: RestaurantDetail(viewModel: RestaurantDetailViewModel(restaurant: restaurant))) {
                    RestaurantRow(restaurant: restaurant)
                }
            }
        }.background(Color(hex: "F1FDDE"))
    }
}



struct FoodOfferRow: View {
    var offer: FoodOffer
    var addToCart: () -> Void

    var body: some View {
        VStack {
            Image(offer.title) // Utilisez le nom de l'offre comme nom d'image (assurez-vous que les images sont dans les assets)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 100)
            
            Text(offer.title)
                .font(.headline)
            
            Text(offer.category)
                .font(.caption)
            
            Button(action: {
                addToCart()
            }) {
                Text("Ajouter au paniers")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}



struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Image(restaurant.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            Text(restaurant.name)
            NavigationLink("", destination: RestaurantDetail(viewModel: RestaurantDetailViewModel(restaurant: restaurant)))
        }.background(Color(hex: "F1FDDE"))
    }
}

class CartModel: ObservableObject {
    @Published var items: [FoodOffer] = []

    func addToCart(_ offer: FoodOffer) {
        items.append(offer)
    }

    func removeFromCart(_ offer: FoodOffer) {
        if let index = items.firstIndex(where: { $0.id == offer.id }) {
            items.remove(at: index)
        }
    }
}

struct CartView: View {
    @ObservedObject var cart: CartModel

    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items) { offer in
                    CartItemView(offer: offer, removeFromCart: { cart.removeFromCart(offer) })
                }
            }
            .navigationBarTitle("Panier", displayMode: .inline)
        }
    }
}

struct CartItemView: View {
    var offer: FoodOffer
    var removeFromCart: () -> Void

    var body: some View {
        HStack {
            Text(offer.title)
                .font(.headline)

            Spacer()

            Button(action: {
                removeFromCart()
            }) {
                Text("Retirer")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cart: CartModel())
            .previewInterfaceOrientation(.portrait)
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgb: UInt64 = 0

        scanner.scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

