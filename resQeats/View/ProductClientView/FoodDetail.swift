//
//  FoodDetail.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
/*struct FoodDetail: View {
    var offer: FoodOffer
    @ObservedObject var viewModel: RestaurantOffersViewModel
    var restaurantName: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Background")
            ScrollView  {
                //Product Image
                
                Image(offer.image)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
             
                HStack{
                    Text(offer.title)
                        .font(.title)
                        .padding(.leading, 20.0)
                    Spacer()
                    Text("Price:\(offer.price) TND")
                        .padding(.trailing, 20.0)
                }
                Text(offer.category.rawValue)
                    .font(.headline)
                Text(offer.description)
                    .font(.body)
                
            }
            .edgesIgnoringSafeArea(.top)
           
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        HStack {
            VStack (alignment: .leading) {
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
     
    
        }
    .background(Color("Background"))
    .cornerRadius(30, corners: [.topLeft, .topRight])
    .offset(x: 0, y: -30.0)
        } }*/







class RestaurantOffersViewModel: ObservableObject {
    @Published var restaurant: Restaurant2
    @Published var cart: [Product] = []

    init(restaurant: Restaurant2) {
        self.restaurant = restaurant
    }
}


/*struct FoodDetail_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetail(offer: restaurants[0].foodOffers[0], viewModel: RestaurantOffersViewModel(restaurant: restaurants[0]), restaurantName: restaurants[0].name)
    }
}*/


struct FoodDetail: View {
    var product: Product
    @ObservedObject var viewModel: ProductViewModel
    //var restaurantName: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Background")
            ScrollView  {
                //Product Image
                
                Image(product.image)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
             
                HStack{
                    Text(product.title)
                        .font(.title)
                        .padding(.leading, 20.0)
                    Spacer()
                    Text("Price:\(product.price) TND")
                        .padding(.trailing, 20.0)
                }
                Text(product.category)
                    .font(.headline)
                Text(product.description)
                    .font(.body)
                
            }
            .edgesIgnoringSafeArea(.top)
           
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        HStack {
            VStack (alignment: .leading) {
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
     
    
        }
    .background(Color("Background"))
    .cornerRadius(30, corners: [.topLeft, .topRight])
    .offset(x: 0, y: -30.0)
        } }





