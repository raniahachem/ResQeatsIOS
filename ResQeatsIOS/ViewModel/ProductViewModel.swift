//
//  ProductViewModel.swift
//  resQeats
//
//  Created by rania hm on 20/11/2023.
//

import Foundation
import CoreLocation

    class ProductViewModel: ObservableObject {
        @Published var products: [Product] = []
        //@Published var cart: [Product] = []
        init(){
            getAllProducts()
           }
        func getAllProducts() {
                guard let url = URL(string: "http://192.168.100.117:5005/product/products") else {
                    print("there is errors with url parsing")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard error == nil else {
                        print("error from completion handler")
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else {
                        print("error from response")
                        return
                    }
                    guard response.statusCode >= 200 && response.statusCode <= 300 else {
                        print ("error from status code")
                        return
                    }
                    guard let data = data?.jsonparsing(letters: "null,") else {
                        print("error with data")
                        return
                    }
                    
                    print(String(data: data, encoding: .utf8) ?? "Invalid data")
                    guard let jsondata = try? JSONDecoder().decode([Product].self, from: data)
                    else{
                        print("error from decoder")
                        return
                    }
                    DispatchQueue.main.async {
                        self.products=jsondata
                        print(self.products)
                    }
                    
                }.resume()
                
            }


    

    
    func ajouterProduit(_ product: Product) {
        // Création d'une instance de User
        
        // Convertir la structure User en données JSON
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(product) else {
            fatalError("Erreur lors de l'encodage en JSON")
        }
        
        // Créer une URLRequest avec l'URL de votre API
        let url = URL(string: "http://192.168.100.117:5005/product/products")! // Remplacez par votre URL
        var request = URLRequest(url: url)
        
        // Configurer la requête en tant que POST et définir le corps de la requête
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Utiliser URLSession pour envoyer la requête
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de requête : \(error.localizedDescription)")
                return
            }
            
            // Traiter la réponse de la requête
            if let httpResponse = response as? HTTPURLResponse {
                print("Code de statut HTTP : \(httpResponse.statusCode)")
                if let responseData = data {
                    // Traiter les données de réponse si nécessaire
                    let responseString = String(data: responseData, encoding: .utf8)
                    print("Réponse : \(responseString ?? "")")
                }
            }
        }
        
        // Démarrer la requête
        task.resume()
    }
    }
    

    
    

extension Data {
    func jsonparsing(letters:String) ->Data? {
        let dataString = String(data:self,encoding:.utf8)
        let parseData = dataString?.replacingOccurrences(of: letters, with: "")
        guard let data = parseData?.data(using: .utf8) else{
            return nil
        }
        return data
    }
}
