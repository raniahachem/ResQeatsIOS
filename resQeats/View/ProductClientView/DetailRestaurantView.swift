//
//  DetailRestaurantView.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import SwiftUI


struct DetailRestaurantView: View {
    @State private var isShowing = false
    @StateObject private var cartManager = CartManager()
    let restaurant: Restaurant2
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //@State private var isReservationViewPresented = false // Controls the reservation page display
    
    @StateObject private var productViewModel = ProductViewModel()
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Product Image
                    Image(restaurant.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(12)
                    Text(restaurant.username)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(restaurant.category)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 4) {
                        ForEach(0 ..< 5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                        }
                        Text("(4.9)") // Rating
                            .foregroundColor(.gray)
                    }
                    
                    // Description Section
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(restaurant.description)
                        .foregroundColor(.secondary)
                        .lineSpacing(8)
                    ProductView(viewModel: productViewModel)
                        .environmentObject(cartManager)
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }), trailing: Image("threeDot"))
   
    }
}



/*struct DetailRestaurantView: View {
    @State private var isShowing = false
    @ObservedObject var productViewModel: ProductViewModel
    let restaurant: Restaurant2
    init(restaurant: Restaurant2) {
            self.restaurant = restaurant
            self.productViewModel = ProductViewModel() // Initialize with an empty array
        }
    //let product: Product
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isReservationViewPresented = false // Controls the reservation page display
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ZStack {
            Color("Background")
            ScrollView  {
                // Product Image
                Image(restaurant.image)                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                Text(restaurant.username)
                    .font(.title)
                    .fontWeight(.bold)
                Text(restaurant.category)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 4) {
                    ForEach(0 ..< 5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                    Text("(4.9)") // Rating
                        .foregroundColor(.gray)
                }
                
                // Description Section
                Text("Description")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(restaurant.description)
                    .foregroundColor(.secondary)
                    .lineSpacing(8)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        //.navigationBarBackButtonHidden(true)
        //.navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}))
        
    }
    
}*/




