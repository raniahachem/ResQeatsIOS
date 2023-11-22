//
//  signUp2.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 22/11/2023.
//
import SwiftUI

struct signUp2: View {
    @State private var showingSheet = false
    @StateObject var signupv = UserViewModel()
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var adresse = ""
    @State private var role = ""
    @State private var mission=""
    var body: some View {
        
       
        VStack(alignment: .leading,spacing: 15, content: {
            
            Text("Signup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .offset(x:83, y:-55)
            
            Text("Add your details to sign up as a recepient")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.top,-5)
                .offset(x:3 , y:-55)
                .opacity(0.3)
                .font(.system(size: 0.1))
            
            
        })
        VStack{
            TextField("Name" , text: $username)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-20)
            
        }
     
        VStack{
            TextField("Email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-5)
            
        }
        
        VStack{
            TextField("password" , text: $password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:10)
            
        }
        
    
        
        VStack{
            TextField("phonenumber" , text: $phoneNumber)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:25)
            
        }
        
        VStack{
            TextField("adresse" , text: $adresse)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:40)
            
        }
        VStack{
            TextField("role" , text: $role)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:55)
            
        }
        VStack{
            TextField("mission" , text: $mission)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:65)
            
        }
        VStack{
            Button("Signup"){
                signUpRecpient(username: username, password: password, email: email, phoneNumber: phoneNumber, adresse: adresse, role: role, mission: mission)
                
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:-3 , y:89)
            
            
            
        }
        VStack{
            Text("already have an an account?")
                .opacity(0.2)
                .offset(x:-10 , y:100)
                .font(.system(size:13))
        }
        
        
        
        
        
     /*   VStack{
            Text("By Creating an account you agree to our ")
            Text("Terms of services and Privacy polices")
            
        }   .opacity(0.19)
            .font(.system(size: 15))
            .offset(x:5,y:27)
        */
        VStack{
            Button("Login"){
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                      Login()
            }
            .foregroundColor(.red)
            .frame(width: 55 , height: 19)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:107 , y:74)
            .font(.system(size: 12))
            
            
            
        }
        //butoon back image manque
    
        

    }
}

func signUpRecpient(username: String,password: String, email: String, phoneNumber: String, adresse: String , role:String,mission:String) {
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
    signUp2()
}

