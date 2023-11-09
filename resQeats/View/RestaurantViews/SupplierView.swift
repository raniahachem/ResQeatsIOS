//
//  SupplierView.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//

import SwiftUI
struct SupplierView: View {
    @State private var isAddingOffer = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Espace Fournisseur")
                    .font(.largeTitle)
                    .padding()

                Button(action: {
                    isAddingOffer.toggle()
                }) {
                    Text("Ajouter une offre")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isAddingOffer) {
                    AddOfferView()
                }

                Text("Mes Offres")
                    .font(.title)
                    .padding(.top)

                //MyOffersView()

                Text("Commandes reçues")
                    .font(.title)
                    .padding(.top)

                OrdersView()
            }
            .navigationBarTitle("Espace Fournisseur", displayMode: .inline)
        }
    }
}

struct SupplierView_Previews: PreviewProvider {
    static var previews: some View {
        SupplierView()
    }
}
