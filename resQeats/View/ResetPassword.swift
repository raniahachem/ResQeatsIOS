//
//  ResetPassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI
import UIKit
import MessageUI


struct ResetPassword: View {
    @State private var email = ""
    let mailButton = UIButton()
    @State private var wrongemail: Float = 0
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                
                    .scale(1.9)
                    .foregroundColor(.green.opacity(0.29))
                Color.white.ignoresSafeArea()
                
                //manque le boutton back
                
                
                
                Label("Reset Password", systemImage: "")
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color.black.opacity(0))
                    .cornerRadius(10)
                    .offset(x:-5, y:-354)
                
                VStack{
                    Spacer(minLength: 30)
                    
                    Label("Please enter your email to receive a link to create ", systemImage:"")
                    Spacer()
                    Label("a new passwordvia email" , systemImage: "")
                }
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0))
                .frame(width: 1200 , height: 150)
                .cornerRadius(10)
                .offset(x:1 , y:-310)
                .opacity(0.35)
                .font(.system(size: 10))
                
                VStack{
                    TextField("email" , text: $email)
                    
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red , width: CGFloat(wrongemail))
                        
                    
                }
                Spacer()
                
                VStack{
                    Button(action:{
                        EmailController.shared.sendEmail(subject: "hello", body: "hello from", to: "koolimootez45@gmail.com")
                    })
                    {
                        Text("send Email")
                    }
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .offset(x:3.5 , y:82)
                    
                }
                
                
            }
        }
    }//fin de view
}//fin de struct

class EmailController: NSObject, MFMailComposeViewControllerDelegate {
    public static let shared = EmailController()
    private override init() { }
    
    func sendEmail(subject:String, body:String, to:String){
        // Check if the device is able to send emails
        if !MFMailComposeViewController.canSendMail() {
           print("This device cannot send emails.")
           return
        }
        // Create the email composer
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients([to])
        mailComposer.setSubject(subject)
        mailComposer.setMessageBody(body, isHTML: false)
        EmailController.getRootViewController()?.present(mailComposer, animated: true, completion: nil)
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        EmailController.getRootViewController()?.dismiss(animated: true, completion: nil)
    }
    
    
    static func getRootViewController() -> UIViewController? {
        // In SwiftUI 2.0
        UIApplication.shared.windows.first?.rootViewController
    }
}
func resetPassword(email: String) {
        // Replace this URL with your actual backend API URL
        DispatchQueue.main.async {
            print("testtest")
//             isLoading = true // Show loading view
         
            let apiUrl = URL(string: "http://192.168.1.113:7019/user/search")!
            
            // Sample user data
            let userData: [String: Any] = [
                //"id": "88",
              //  "username": username,
                //"fname": "jarreeay",
                //"phone": 1235455555,
                //"password": password,
                "email": email,
              //  "phoneNumber": phoneNumber,
                //"username": "fay",
                //"adresse":adresse,
                //"role":role,
                //"mission":mission
                
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
    ResetPassword()
}
