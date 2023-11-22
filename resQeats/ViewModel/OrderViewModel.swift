//
//  OrderViewModel.swift
//  resQeats
//
//  Created by rania hm on 22/11/2023.
//

import Foundation
import CoreLocation

    class OrderViewModel: ObservableObject {
        @Published var orders: [Order] = []
        
        init(){
            getAllOrders()
           }
        func getAllOrders() {
                guard let url = URL(string: "http://192.168.100.117:5005/oder/orders") else {
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
                    guard let jsondata = try? JSONDecoder().decode([Order].self, from: data)
                    else{
                        print("error from decoder")
                        return
                    }
                    DispatchQueue.main.async {
                        self.orders=jsondata
                        print(self.orders)
                    }
                    
                }.resume()
                
            }
        
       /* func getOrdersForRestaurant(restaurantId: String) {
                // Construisez l'URL avec l'ID du restaurant
                guard let url = URL(string: "http://192.168.100.117:5005/restaurant/restaurants/\(restaurantId)/orders") else {
                    print("Il y a des erreurs avec l'analyse de l'URL")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, response, error in
                    // ... Votre logique de gestion des erreurs ici ...

                    guard let jsondata = try? JSONDecoder().decode([Order].self, from: data ?? Data()) else {
                        print("Erreur du décodeur")
                        return
                    }
                    DispatchQueue.main.async {
                        self.orders = jsondata
                        print(self.orders)
                    }

                }.resume()
            }*/
    }





