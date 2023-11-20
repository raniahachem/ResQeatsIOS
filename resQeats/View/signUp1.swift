//
//  signUp1.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI

struct signUp1: View {
    @StateObject var signupController = UserViewModel()
    @State private var name = ""
    @State private var email = ""
    @State private var MobileNo = ""
    @State private var Password = ""
    @State private var ConfirmPassword = ""
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
            TextField("Name" , text: $name)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-70)
        }
        VStack{
            TextField("Email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-55)
        }
        VStack{
            TextField("MobileNo" , text: $MobileNo)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-40)
        }
        VStack{
            TextField("Password" , text: $Password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-25)
        }
        VStack{
            TextField("confirmPassword" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-10)
        }
        VStack{
            Button("Next"){
                
                
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:-3 , y:25)
        }
        VStack{
            Text("already have an an account?")
                .opacity(0.2)
                .offset(x:-3 , y:100)
                .font(.system(size:10))
        }
        VStack{
            Button("Login"){
                
            }
            .foregroundColor(.red)
            .frame(width: 55 , height: 19)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:95 , y:77)
            .font(.system(size: 12))
        }
    }
}




#Preview {
    signUp1()
}
