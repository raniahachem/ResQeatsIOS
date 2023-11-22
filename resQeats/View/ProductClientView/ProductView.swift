//
//  ProductView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI
/*struct ProductView: View {
    @State private var selectedTab = 0 // Assurez-vous que cette variable est dans
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var selectedLogo: String?
@StateObject private var pl = ProductViewModel()
    @EnvironmentObject var cartManager: CartManager
                
    struct LogoListView: View {
        let logos: [String] = ["logoferrari", "logotesla", "logocupra", "logocitroen", "logopeugeot", "logonissan", "logoaudi", "lgomini", "logoseat"]

        @Binding var selectedLogo: String?

        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [GridItem(.fixed(80))], spacing: 10) {
                    // Bouton pour afficher tous les logos
                    Button(action: {
                        selectedLogo = nil // Afficher tous les logos
                    }) {
                        Text("Tous")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    // Afficher chaque logo dans la liste
                    ForEach(logos, id: \.self) { logo in
                        Button(action: {
                            selectedLogo = logo // Sélectionnez le logo
                        }) {
                            Image(logo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
            }
        }
    }


    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                      
                    .ignoresSafeArea()
                
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading) {
                        
                        AppBarView()
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView(search: $search)
                        LogoListView(selectedLogo: $selectedLogo)

                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                
                            }
                            .padding()
                        }
                        
                        Text("Populaire")
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .padding(.horizontal)
                            .foregroundColor(Color.black.opacity(0.9))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                ForEach(pl.products, id: \._id) { product in
                                    NavigationLink(destination: DetailScreen(product: product)) {
                                        ProductCardView(product: product)
                                    }
                                }
                                .padding(.leading)
                            }
                        }
                    
                        .padding(.bottom)
                        
                        Text("Nos nouvelles voitures")
                            .font(.custom("PlayfairDisplay-Bold", size: 19))
                            .foregroundColor(Color.black.opacity(0.9))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(pl.products, id: \._id) { product in
                                    ProductCardView(product: product)
                                    NavigationLink(
                                        destination: DetailScreen(product: product), // Ajout de la destination
                                        label: {
                                            ProductCardView(product: product)
                                        }
                                    )
                                }

                                .padding(.leading)
                            }
                        }
                        
                    }
                }
                
                VStack {
                    Spacer()
                   
                }
            }
        }
    }
    
}

    
    
    struct AppBarView: View {

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
                    Button(action: {
                        isProductForumViewPresented.toggle() // Activez la présentation de la page ProductForumView

                    }) {
                        Image(systemName: "plus")

                            .font(.title) // Utilisez une icône "+" de système

                            .foregroundColor(.blue)
                    }
                    /*.sheet(isPresented: $isProductForumViewPresented) {

                        ProductFormView() // Afficher la vue ProductForumView
                    }*/
                }
                .padding(.horizontal)
            }
        }

    
    
    struct TagLineView: View {
        var body: some View {
            VStack{
                Text("  Trouvez les \nmeilleures ")
                    .font(.custom("PlayfairDisplay-Regular", size: 22))
                    .foregroundColor(Color.black.opacity(0.5))
                
                + Text("Voitures!")
                    .font(.custom("PlayfairDisplay-Bold", size: 26))
                    .fontWeight(.bold)
                    .foregroundColor(Color.blue)
            }            .offset(x:70,y:0) // Centrer horizontalement

        }
    }
    
    struct SearchAndScanView: View {
        @Binding var search: String
        
        var body: some View {
            HStack {
                HStack {
                    Image("Search")
                        .padding(.trailing, 8)
                        .foregroundColor(.blue)
                    TextField("Rechercher des voitures...", text: $search)
                        .padding(.all, 20)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .padding(.trailing, 8)
                        
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
                    .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
                if (isActive) { Color("Primary")
                        .frame(width: 15, height: 2)
                        .clipShape(Capsule())
                }
            }
            .padding(.trailing)
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
    }
    
    
  
    
    
    
    
    struct UserSetingsView_Previews: PreviewProvider {
        static var previews: some View {
            ProductView()
        }
    }
 */

struct ProductView: View {

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
}

