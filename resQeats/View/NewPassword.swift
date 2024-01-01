//
//  NewPassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI


struct NewPassword: View {
    @State private var showingSheet = false
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var wrongpassword: Float = 0
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                Rectangle()
                
                    .scale(1.9)
                    .foregroundColor(.green.opacity(0.29))
                Color.white.ignoresSafeArea()
                
                Label("New Password", systemImage: "")
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color.black.opacity(0))
                    .cornerRadius(10)
                    .offset(x:-5, y:-254)
                
                VStack{
                    Spacer(minLength: 20)
                    
                    Label("Create a new Password ", systemImage:"")
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0))
                        .frame(width: 1200 , height: 150)
                        .cornerRadius(10)
                        .offset(x:-1 , y:-520)
                        .opacity(0.35)
                        .font(.system(size: 10))
                    
                }
                VStack{
                    TextField("email" , text: $email)
                    
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .offset(x:4 , y:-69)
                        .border(.red , width: CGFloat(wrongpassword))
                    
                }
                Spacer(minLength: 15)
                Spacer()
                
                VStack{
                    TextField(" new Password" , text: $password)
                    
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red , width: CGFloat(wrongpassword))
                        .offset(x: 2, y:10)
                    
                    
                }
                
                Spacer()
                VStack{
                    Button("Next"){
                        showingSheet.toggle()
                        newPasswordClient(email: email, password: password)
                        //newPasswordBeneficiaire(email: email, password: password)
                        
                    }
              
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .offset(x:3.5 , y:82)
                    
                    
                    
                }
                
            }
        }
        
        
    }
    
    
}
func newPasswordClient(email : String , password: String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:7019/user/resetpassword")!
            
            // Sample user data
            let userData: [String: Any] = [
                //"id": "88",
                //"username": username,
                //"fname": "jarreeay",
                //"phone": 1235455555,
                "password": password,
                "email": email,
              //  "phoneNumber": phoneNumber,
                //"username": "fay",
            //    "adresse":adresse,
              //  "role":role,
              //  "mission":mission
                
            ]

            do {
                // Convert the user data to JSON
                let jsonData = try JSONSerialization.data(withJSONObject: userData)

                // Create a URLRequest with the API URL
                var request = URLRequest(url: apiUrl)

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
                        // Note: You should handle this according to your API response format
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                            print("Response: \(jsonResponse)")
                            // You can update your UI or perform other actions based on the response
                        } catch {
                            print("Error parsing JSON: \(error.localizedDescription)")
                        }
                    }
                }.resume()
            } catch {
                print("Error converting data to JSON: \(error.localizedDescription)")
            }
        }
    }

func newPasswordBeneficiaire(email : String , password: String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:7019/beneficiaire/resetpassword")!
            
            // Sample user data
            let userData: [String: Any] = [
                //"id": "88",
                //"username": username,
                //"fname": "jarreeay",
                //"phone": 1235455555,
                "password": password,
                "email": email,
              //  "phoneNumber": phoneNumber,
                //"username": "fay",
            //    "adresse":adresse,
              //  "role":role,
              //  "mission":mission
                
            ]

            do {
                // Convert the user data to JSON
                let jsonData = try JSONSerialization.data(withJSONObject: userData)

                // Create a URLRequest with the API URL
                var request = URLRequest(url: apiUrl)

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
                        // Note: You should handle this according to your API response format
                        do {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                            print("Response: \(jsonResponse)")
                            // You can update your UI or perform other actions based on the response
                        } catch {
                            print("Error parsing JSON: \(error.localizedDescription)")
                        }
                    }
                }.resume()
            } catch {
                print("Error converting data to JSON: \(error.localizedDescription)")
            }
        }
    }

#Preview {
    NewPassword()
}
