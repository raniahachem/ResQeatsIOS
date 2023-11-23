//
//  HomeScreen2.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI

struct HomeScreen2View: View {
    @State private var selectedTab = 0 // Assurez-vous que cette variable est dans
    @State private var search: String = ""
    @State private var selectedIndex2: Int = 0
    @State private var selectedLogo: String?
    @StateObject private var rl = RestaurantViewModel()
    @StateObject var cartManager = CartManager()
    @StateObject private var productViewModel = ProductViewModel()
    
    
    private let categories = ["Restaurants", "Bakeries", "Caterers"]
    // Le reste de votre AppBarView
    
    
    var filteredRestaurants: [Restaurant2] {
        if search.isEmpty {
            return rl.restaurants
        } else {
            return rl.restaurants.filter { $0.username.lowercased().contains(search.lowercased()) }
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView2()
                        
                        TagLineView2()
                            .padding()
                        
                        SearchAndScanView2(search: $search)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                
                            }
                            .padding()
                        }
                        
                        Text("Popular restaurants")
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .padding(.horizontal)
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(rl.restaurants, id: \._id) { restaurant in
                                    NavigationLink(destination: DetailRestaurantView(restaurant: restaurant),
                                                   label: {
                                        RestaurantCardView(restaurant: restaurant, size: 180)
                                    }
                                    )
                                }
                                
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        Text("All Products") // or any appropriate title
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .padding(.horizontal)
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                                                  HStack(spacing: 0) {
                                                      ForEach(productViewModel.products, id: \._id) { product in
                                                          NavigationLink(destination: FoodDetail(product: product, viewModel: productViewModel)) {
                                                              ProductCardView(product: product)
                                                          }
                                                          .padding(.leading)
                                                      }
                                                  }
                                              }
                                              
                                              VStack {
                                                  Spacer()
                                              }
                                                                }
                                                            }
                                                        }
                                                        .onAppear {
                                                            // Fetch all products when the view appears
                                                            productViewModel.getAllProducts()
                                                        }
                                                        .environmentObject(productViewModel)
                                                    }
                                                }
}
    
    struct AppBarView2: View {

            @State private var isProductForumViewPresented = false // Ajoutez un état pour contrôler la présentation
            var body: some View {

                HStack {
                    Button(action: {}) {
                        Image("menu")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10.0)
                    }

                    Spacer()
                   
                    /*.sheet(isPresented: $isProductForumViewPresented) {

                        ProductFormView() // Afficher la vue ProductForumView
                    }*/
                }
                .padding(.horizontal)
            }
        }

    
    
    struct TagLineView2: View {
        var body: some View {
            Text("Find the best food deals \n")
                .font(.custom("PlayfairDisplay-Regular", size: 28))
            
                .foregroundColor(Color("GreenforB"))
                + Text("in your zone!")
                .font(.custom("PlayfairDisplay-Bold", size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color("GreenforB"))
        }
    }
    
    struct SearchAndScanView2: View {
        @Binding var search: String
        var body: some View {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                    TextField("Search", text: $search)
                }
                .padding(.all, 20)
                .background(Color.white)
                .cornerRadius(10.0)
                .padding(.trailing, 8)
                
                Button(action: {
                }) {
                    Image(systemName: "mappin.circle")
                        .padding()
                        .background(Color("GreenforB"))
                        .cornerRadius(10.0)
                }
            }
            .padding(.horizontal)
        }
    }

    
    struct CategoryView2: View {
        let isActive: Bool
        let text: String
        var body: some View {
            VStack (alignment: .leading, spacing: 0) {
                Text(text)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
                if (isActive) { Color("Primary")
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
        }
    }

    

                                            
