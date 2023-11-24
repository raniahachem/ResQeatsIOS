//
//  Login.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI
import AuthenticationServices

struct Login: View {
    @State private var showingSheet = false
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.green.ignoresSafeArea()
                Circle()
                    .scale(1.9)
                    .foregroundColor(.white.opacity(0.29))
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                
                VStack{
                    Text("LOGIN")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    TextField("UserName" , text: $username)
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red , width: CGFloat(wrongUsername))
                    SecureField("Password" , text: $password)
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red , width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                       // authenticateUser(username: username, password: password)
                        loginsuccess(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Button("Creta an Account"){
                        authenticateUser(username: username, password: password)
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                                signup()
                 }
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    NavigationLink(destination: Text ("you are logged in @\(username)"),isActive:$showingLoginScreen ){
                        EmptyView()
                    }
    
            
                // manque le label forgot password
                   
                   /* Image("fb").resizable()
                        .frame(width: 55, height: 19)
                        .offset(x:55 , y:75)
                    
                    Image("google").resizable()
                        .frame(width: 35, height: 19)
                        .offset(x:-52 , y:49) */
                }
                }
            }.navigationBarHidden(true)
        } // fin de view
    func authenticateUser(username:String , password : String){
        if username.lowercased() == "caircoers"{
            wrongUsername = 0
            if password.lowercased() == "123456"{
                wrongPassword = 0
                showingLoginScreen = true
            }
        }
        else {
            wrongPassword = 2
            /*   else {
                   wrongUsername = 2
                   
               }*/
        }
    }
        }
func loginsuccess(username: String,password: String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:7001/user/users")!
            
            // Sample user data
            let userData: [String: Any] = [
                //"id": "88",
                "username": username,
                //"fname": "jarreeay",
                //"phone": 1235455555,
                "password": password,
                //"username": "fay",
            ]
            print ("teset123")

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
    Login()
}
