//
//  RestaurantViewModel.swift
//  resQeats
//
//  Created by rania hm on 21/11/2023.
//

import Foundation
import CoreLocation

    
    class RestaurantViewModel: ObservableObject {
        @Published var restaurants: [Restaurant2] = []

        init(){
            getAllRestaurants()
           }
        func getAllRestaurants() {
                guard let url = URL(string: "http://172.18.32.60:5005/restaurant/restaurants") else {
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
                    guard let jsondata = try? JSONDecoder().decode([Restaurant2].self, from: data)
                    else{
                        print("error from decoder")
                        return
                    }
                    DispatchQueue.main.async {
                        self.restaurants=jsondata
                        print(self.restaurants)
                    }
                    
                }.resume()
                
            }

    }
