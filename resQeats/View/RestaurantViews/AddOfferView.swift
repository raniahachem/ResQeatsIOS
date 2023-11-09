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
                Section(header: Text("all fields ae required")
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.339, green: 0.435, blue: 0.361))) {
                    TextField("Titre de l'offre", text: $title)
                    
                    Picker("Catégorie", selection: $category) {
                        Text("Healthy").tag("Healthy")
                        Text("Vegan").tag("Vegan")
                        Text("Gluten Free").tag("Gluten Free")
                        Text("Dessert").tag("Dessert")
                        Text("Fast Food").tag("Fast Food")
                        Text("Main meal").tag("Main meal")
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
                    Text("Add")
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(hex: "566F5C"))
                .cornerRadius(10)
            }
            .navigationTitle("Add a new food offer")
        }
        .alert(isPresented: $isOfferAdded) {
            Alert(title: Text("Offer was added"), message: Text("Offer was added sucecessfully"), dismissButton: .default(Text("OK")))
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
