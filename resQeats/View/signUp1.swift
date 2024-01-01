//
//  signUp1.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI

struct signUp1: View {
    @State private var showingSheet = false
    @StateObject var signupController = UserViewModel()
    @State private var username = ""
    @State private var password = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var adresse = ""
    @State private var role = ""
    @State private var isLoading = false
    var body: some View{
        VStack(alignment: .leading,spacing: 15, content: {
            Text("Signup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .offset(x:105, y:-120)
            
            Text("Add your details to sign up as a food supplier")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.top,-5)
                .offset(x:3 , y:-100)
                .opacity(0.3)
                .font(.system(size: 0.1))
        })
        VStack{
            TextField("username" , text: $username)
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-70)
        }
        VStack{
            TextField("password" , text: $password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-55)
        }
        VStack{
            TextField("email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-40)
        }
        VStack{
            TextField("PhoneNumber" , text: $phoneNumber)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-25)
        }
        VStack{
            TextField("adresse" , text: $adresse)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-10)
        }
        VStack{
            TextField("role" , text: $role)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:15)
        }
        VStack{
            Button("Sign Up"){
                signUp(username: username, password: password, email: email, phoneNumber: phoneNumber , adresse:adresse ,role: role)
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:-3 , y:55)
        }
        VStack{
            Button("already have an an account?"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                      Login()
            }
                .opacity(2)
                .offset(x:-3 , y:80)
                .font(.system(size:10))
        }
      
        }
    }



func signUp(username: String,password: String, email: String, phoneNumber: String, adresse: String , role:String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:7019/user/users")!
            
            // Sample user data
            let userData: [String: Any] = [
                //"id": "88",
                "username": username,
                //"fname": "jarreeay",
                //"phone": 1235455555,
                "password": password,
                "email": email,
                "phoneNumber": phoneNumber,
                //"username": "fay",
               
                "adresse":adresse,
                "role":role
                
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
    signUp1()
}





