//
//  DetailScreen.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

/*import SwiftUI
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
}*/



import SwiftUI


struct DetailScreen: View {
    @State private var isShowing = false
    let product: Product

  
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isReservationViewPresented = false // Controls the reservation page display
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Product Image
                    Image(product.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(12)
                    
                    Text(product.category)
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
                    
                    Text(product.description)
                        .foregroundColor(.secondary)
                        .lineSpacing(8)
                    
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: { presentationMode.wrappedValue.dismiss() }), trailing: Image("threeDot"))
        .overlay(
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    Button(action: {
                        isShowing.toggle()
                    }) {
                        VStack {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            
                            Text("Glisser vers le haut pour réserver")
                                .fontWeight(.medium)
                                .opacity(0.7)
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .sheet(isPresented: $isShowing) {
                        /*ReservationFormView(isVisible: .constant(true), isReserving: .constant(false))
                            .body
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)*/
                    }
                    .padding(.horizontal)
                    .frame(width: geometry.size.width) // Match the button width with the screen width
                    .offset(y: -15)
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom) // Place the VStack at the bottom of the screen
            }
        )
    }
}



//image random slide
struct ImageSliderView: View {
    
    @State private var currentIndex = 0
    var slides: [String] = ["audi3 1", "audi2", "audi1", "audi4"]
    var isNewBadgeVisible: Bool = true // You can enable or disable as needed
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            ZStack(alignment: .trailing){
                
                Image(slides[currentIndex])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .shadow(color: Color.blue, radius: 5, x: 0, y: 5) // Add a blue shadow
                    .offset(x: 0, y: 50)
                    .clipped()
            }
            
            HStack(alignment: .bottom) {
                ForEach(0..<slides.count) { index in
                    Circle()
                        .fill(self.currentIndex == index ? Color.blue : Color.gray)
                        .frame(width: 8, height: 8)
                        .offset(x: 150, y: 40) // Adjust the offset for horizontal positioning
                }
            }
            .padding()
        }
        .padding()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if self.currentIndex + 1 == self.slides.count {
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}



struct ProductDetailRow: View {
    let imageName: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                Text(value)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
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


        


struct ReserveButton: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        Button(action: {
            isVisible.toggle()
        }) {
            Text("Réserver")
                .font(.title)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
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




