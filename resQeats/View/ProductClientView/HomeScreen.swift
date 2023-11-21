//
//  HomeScreen.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
struct HomeScreen: View {
    @StateObject var cartManager = CartManager()
    @State private var search: String = ""
    @State private var selectedIndex: Int = 0

    private let categories = ["Restaurants", "Bakeries", "Caterers"]

    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack {
                        //AppBarView2()
                        //TagLineView2()
                        //SearchAndScanView2(search: $search)

                        /*ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { i in
                                    Button(action: { selectedIndex = i }) {
                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
                                    }
                                }
                            }
                            .padding()
                        }

                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.trailing, 220.0)
                            
                            

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(restaurants) { restaurant in
                                    NavigationLink(
                                        destination: DetailScreen(restaurant: restaurant),
                                        label: {
                                            RestaurantCardView(restaurant: restaurant, size: 180)
                                        }
                                    )
                                        .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }.padding(.bottom)

                        Text("Healthy")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.trailing, 220.0)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(restaurants) { restaurant in
                                    if restaurant.category == "Healthy" {
                                        NavigationLink(
                                            destination: DetailScreen(restaurant: restaurant),
                                            label: {
                                                RestaurantCardView(restaurant: restaurant, size: 180)
                                            }
                                        )
                                            .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                }
                                .padding(.leading)
                            }
                        }

                        Text("Gluten Free")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.trailing, 220.0)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(restaurants) { restaurant in
                                    if restaurant.category == "Gluten Free" {
                                        NavigationLink(
                                            destination: DetailScreen(restaurant: restaurant),
                                            label: {
                                                RestaurantCardView(restaurant: restaurant, size: 180)
                                            }
                                        )
                                            .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                }
                                .padding(.leading)
                            }
                        }.padding(.bottom)*/
                    }
                }

                /*VStack {
                    Spacer()
                    BottomNavBarView()
                }*/
            }
        }
    }
}


/*struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}*/



struct AppBarView2: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(uiImage: #imageLiteral(resourceName: "Profile"))
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
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

struct SearchAndScanView: View {
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

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("GreenforB") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 15, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct RestaurantCardView: View {
    let restaurant: Restaurant
    let size: CGFloat
    var body: some View {
        VStack {
            Image(restaurant.imageName)
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text(restaurant.name)
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


/*struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("Offer"), action: {})
            BottomNavBarItem(image: Image("shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}*/
