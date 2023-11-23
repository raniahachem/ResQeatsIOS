//
//  Profile.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 14/11/2023.
//

import SwiftUI

struct Profile: View {
    @State private var showingSheet = false
   @State private var username = ""
   @State private var email = ""
   @State private var password = ""
   @State private var adresse = ""
   @State private var phoneNumber = ""
   @State private var mission = ""
   @State private var role = ""
    var body: some View {
        Color(.white)
            .ignoresSafeArea(.all)
        VStack(alignment: .leading,spacing: 15, content: {
            
           Text("")
                .font(.system(size: 29))
                .font(.largeTitle)
                .fontWeight(.light)
                .offset(x:-145, y:-60)
           
          
        })
        VStack{
            
            Image("profileimage")
            
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                .frame(width: 19,height: 75)
                .offset(x:-5,y:-50)
            
        }
        
        VStack{
            Button("Edit Profile"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                        signup()
         }

            .foregroundColor(.black)
            .frame(width: 300 , height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:-5 , y:-80)
            
        }
        /*VStack{
            
            Text("Hi there \(username)!")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundStyle(.black)
                .padding(.top,-5)
                .offset(x:3 , y:-145)
                .opacity(3)
                .font(.system(size: 0.1))
                .offset(x: -11 , y:-22)
        }*/
        VStack{
            Button("Sign out"){
                
            }
            .foregroundColor(.black)
            .frame(width: 300 , height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:-10 , y:-100)
        }
        VStack{
            TextField("Name" , text: $username)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-80)
            
        }
        VStack{
            TextField("Email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-75)
            
        }
        
        VStack{
            TextField("password" , text: $password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-70)
            
        }
        
        VStack{
            TextField("phoneNumber" , text: $phoneNumber)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-65)
            
        }
        VStack{
            TextField("adresse" , text: $adresse)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-60)
            
        }
        VStack{
            TextField("role" , text: $role)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-55)
            
        }
        VStack{
            TextField("mission" , text: $mission)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-50)
            
        }

        
        VStack{
            Button("Save"){
                EditProfile(username: username, password: password, email: email, phoneNumber: phoneNumber, adresse: adresse, role: role, mission: mission)
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:-3 , y:-35)
            
            
            
        }
        
        
        
    }
}
//Erruer dans le code quelque part utilise le debug 
func EditProfile(username: String,password: String, email: String, phoneNumber: String, adresse: String , role:String,mission:String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:5005/user/users")!
            
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
                "role":role,
               "mission":mission
                
            ]

            do {
                // Convert the user data to JSON
                let jsonData = try JSONSerialization.data(withJSONObject: userData)

                // Create a URLRequest with the API URL
                var request = URLRequest(url: apiUrl)

                // Set the request method to POST
                request.httpMethod = "PUT"

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
    Profile()
}
