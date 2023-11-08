//
//  AddOfferView.swift
//  resQeats
//
//  Created by rania hm on 8/11/2023.
//
import SwiftUI

struct AddOfferView: View {
    @State private var title = ""
    @State private var category = "Healthy"
    @State private var description = ""
    @State private var price = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var isOfferAdded = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nouvelle Offre Alimentaire")) {
                    TextField("Titre de l'offre", text: $title)
                    
                    Picker("Catégorie", selection: $category) {
                        Text("Healthy").tag("Healthy")
                        Text("Vegan").tag("Vegan")
                        Text("Gluten Free").tag("Gluten Free")
                        Text("Dessert").tag("Dessert")
                        Text("Fast Food").tag("Fast Food")
                        Text("Plat  Principal").tag("Plat Principal")
                        Text("Tunisian").tag("Tunisian")
                    }
                     
                    TextField("Description", text: $description)
                    TextField("Prix", text: $price)
                    
                    HStack {
                        Text("Image")
                            .foregroundColor(.primary)
                        Spacer()
                        Button(action: {
                            isImagePickerPresented = true
                        }) {
                            Image(systemName: "photo.on.rectangle")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                }
                
                Button(action: {
                    isOfferAdded = true
                }) {
                    Text("Ajouter")
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "566F5C"))
                .cornerRadius(10)
            }
            .navigationTitle("Ajouter une Offre")
            .background(Color(hex: "F1FDDE")) 
        }
        .alert(isPresented: $isOfferAdded) {
            Alert(title: Text("Offre Ajoutée"), message: Text("L'offre a été ajoutée avec succès."), dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

struct AddOfferView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferView()
    }
}
