//
//  AddOfferView.swift
//  resQeats
//
//  Created by rania hm on 14/11/2023.
//

import SwiftUI
struct AddOfferView: View {
    
    @State private var title: String = ""
    @State private var selectedCategory: Product.Category = .healthy
    @State private var description: String = ""
    @State private var price: String = ""
    //@State private var selectedImage: UIImage?
    @State private var image: String = ""
    //@State private var isImagePickerPresented = false
    @State private var quantity: String = ""
    @State private var isAddSuccessful = false


    private let apiURL = URL(string: "http://172.20.10.5:5005/product/products")!

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Offer title", text: $title)
                }

                Section(header: Text("Category")) {
                                    Picker("Category", selection: $selectedCategory) {
                                        ForEach(Product.Category.allCases, id: \.self) { category in
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
                        //.keyboardType(.numberPad)
                }
                Section(header: Text("Image")) {
                    TextField("Image", text: $image)
                        //.keyboardType(.numberPad)
                }

                /*Section(header: Text("Image")) {
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
                }*/
                Section(header: Text("Quantity")) {
                    TextField("Quantity", text: $quantity)
                        //.keyboardType(.numberPad)
                }
            }
            //.sheet(isPresented: $isImagePickerPresented) {
               // ImagePicker(selectedImage: $selectedImage)
            //}

            .toolbar {
                

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        addProduct()
                    }
                    .disabled(title.isEmpty)
                }

                        }
            .navigationTitle("Add new offer")
                        .alert(isPresented: $isAddSuccessful) {
                            Alert(
                                title: Text("Offer Added Successfully"),
                                message: Text("Your offer has been added successfully."),
                                dismissButton: .default(Text("OK")) {
                                    // Ajoutez ici toute logique de nettoyage ou d'autres actions après la réussite
                                    // Réinitialisez le formulaire, par exemple
                                    clearForm()
                                }
                            )
                        }
        }
    }
    private func addProduct() {
           // Sample user data
           let productData: [String: Any] = [
               "title": title,
               "category": selectedCategory.rawValue,
               "description": description,
               "price": price,
               "image": image,
               "quantity": quantity,
               //"restaurant": "65594e93fb8b75c44f353fb5"
               "restaurant": "655de1b751f0479d5d893fc6"     
               // Add other fields as needed
           ]

           do {
               // Convert the product data to JSON
               let jsonData = try JSONSerialization.data(withJSONObject: productData)

               // Create a URLRequest with the API URL
               var request = URLRequest(url: apiURL)

               // Set the request method to POST
               request.httpMethod = "POST"

               // Set the request body with the JSON data
               request.httpBody = jsonData

               // Set the request header to indicate JSON content
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")

               // Make the request
               URLSession.shared.dataTask(with: request) { (data, response, error) in
                   // Handle the response and error here
                   if let error = error {
                       print("Error: \(error.localizedDescription)")
                   } else if let data = data {
                       // Parse and handle the response data
                       do {
                           let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                           print("Response: \(jsonResponse)")

                           // Ajouter cette ligne pour montrer l'alerte en cas de succès
                           isAddSuccessful = true
                       } catch {
                           print("Error parsing JSON: \(error.localizedDescription)")
                       }
                   }
               }.resume()
           } catch {
               print("Error converting data to JSON: \(error.localizedDescription)")
           }
       }

       private func clearForm() {
           // Ajoutez ici le code pour réinitialiser les champs du formulaire
           title = ""
           selectedCategory = .healthy
           description = ""
           price = ""
           image = ""
           //selectedImage = nil
           //isImagePickerPresented = false
           quantity = ""
       }
   
   }

   struct AddOfferView_Previews: PreviewProvider {
       static var previews: some View {
           AddOfferView()
       }
   }

    
    
