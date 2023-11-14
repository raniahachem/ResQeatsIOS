//
//  AddOfferView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI

struct AddOfferView: View {
    @State private var title: String = ""
    @State private var selectedCategory: Category = .healthy
    @State private var description: String = ""
    @State private var price: String = ""
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var quantity: String = ""
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Offer title", text: $title)
                }

                Section(header: Text("Category")) {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }

                Section(header: Text("Price")) {
                    TextField("Price", text: $price)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Image")) {
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
                Section(header: Text("Quantity")) {
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.numberPad)
                }
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        // Handle cancel action
                    }
                label: {
                               Label("Cancel", systemImage: "xmark")
                                   .labelStyle(.iconOnly)
                           }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        // Handle done action
                    }
                label: {
                                   Label("Done", systemImage: "checkmark")
                                       .labelStyle(.iconOnly)
                               }.disabled(title.isEmpty)
                    .disabled(title.isEmpty)
                }
            }
            .navigationTitle("Add new offer")
        }
    }
}

struct AddOfferView_Previews: PreviewProvider {
    static var previews: some View {
        AddOfferView()
    }
}

