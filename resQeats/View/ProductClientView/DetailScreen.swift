//
//  DetailScreen.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
struct DetailScreen: View {
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var restaurant: Restaurant // Ajoutez cette propriété

    var body: some View {
        ZStack {
            Color("Background")
            ScrollView  {
                // Product Image
                Image(restaurant.imageName) // Utilisez la propriété de restaurant
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)

                DescriptionView(restaurant: restaurant) // Pass the restaurant to DescriptionView

                                let viewModel = RestaurantOffersViewModel(restaurant: restaurant)
                RestaurantOffers(viewModel: viewModel, restaurantName: viewModel.restaurant.name)
            }
            .edgesIgnoringSafeArea(.top)
        }
        //.navigationBarBackButtonHidden(true)
        //.navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}))
        
    }
    
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}




struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var restaurant: Restaurant

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title
            Text(restaurant.name)
                .font(.title)
                .fontWeight(.bold)

            // Rating
            HStack(spacing: 4) {
                ForEach(0 ..< 5) { _ in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }

            // Description
            Text("Description")
                .font(.title2)
                .fontWeight(.medium)

            Text(restaurant.description)
                .lineSpacing(8.0)
                .opacity(0.6)

            // Colors and Counter
            HStack {
                VStack(alignment: .leading) {
                    // You can add more information here if needed
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Background"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}



