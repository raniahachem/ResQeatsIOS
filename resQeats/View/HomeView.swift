//
//  HomeView.swift
//  resQeats
//
//  Created by rania hm on 9/11/2023.
//

import SwiftUI
struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Welcome back")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 20)
                
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "mappin.circle")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing, 20)
            }
            
            // Votre composant graphique au milieu, comme vous le souhaitez
            
            Spacer()
            
            VStack(spacing: 20) { // Utilisez un VStack pour aligner les boutons verticalement
                NavigationLink(destination: ContentView(cart: CartModel())) {
                    CategoryButton(imageName: "restaurant", title: "Restaurants")
                }
                
                NavigationLink(destination: SupermarketView()) {
                    CategoryButton(imageName: "cart", title: "Supermarkets")
                }
                
                NavigationLink(destination: BakeryView()) {
                    CategoryButton(imageName: "baguette", title: "Bakery")
                }
                
                NavigationLink(destination: CatererView()) {
                    CategoryButton(imageName: "chef.hat", title: "Caterer")
                }
            }
            .padding()
        }
    }
}

struct CategoryButton: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 40))
                .padding(10)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(20)

            Text(title)
                .font(.headline)
                .padding(.top, 5)
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
