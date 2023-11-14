//
//  Profile.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 14/11/2023.
//

import SwiftUI

struct Profile: View {
   @State private var name = ""
   @State private var email = ""
   @State private var mobileNo = ""
   @State private var adresse = ""
   @State private var password = ""
   @State private var confirmPassword = ""
    var body: some View {
        Color(.white)
            .ignoresSafeArea(.all)
        VStack(alignment: .leading,spacing: 15, content: {
            
            Text("Profile")
                .font(.system(size: 29))
                .font(.largeTitle)
                .fontWeight(.light)
                .offset(x:-145, y:-130)
            
          
        })
        VStack{
            
            Image("profileimage")
            
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                .frame(width: 19,height: 75)
                .offset(x:-5,y:-120)
            
        }
        
        VStack{
            Button("Edit Profile"){
                
            }
            .foregroundColor(.black)
            .frame(width: 300 , height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:-5 , y:-159)
            
        }
        VStack{
            
            Text("Hi there \(name)!")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundStyle(.black)
                .padding(.top,-5)
                .offset(x:3 , y:-145)
                .opacity(3)
                .font(.system(size: 0.1))
                .offset(x: -11 , y:-22)
        }
        VStack{
            Button("Sign out"){
                
            }
            .foregroundColor(.black)
            .frame(width: 300 , height: 50)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:-10 , y:-180)
        }
        VStack{
            TextField("Name" , text: $name)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-160)
            
        }
        VStack{
            TextField("Email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-140)
            
        }
        
        VStack{
            TextField("MobileNo" , text: $mobileNo)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-120)
            
        }
        
        VStack{
            TextField("adresse" , text: $adresse)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-100)
            
        }
        VStack{
            TextField("password" , text: $password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-80)
            
        }
        VStack{
            TextField("confirmpassword" , text: $confirmPassword)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-60)
            
        }
        VStack{
            Button("Save"){
                
            }
            .foregroundColor(.white)
            .frame(width: 300 , height: 50)
            .background(Color.green)
            .cornerRadius(10)
            .offset(x:-3 , y:-35)
            
            
            
        }
        
        
        
    }
}

#Preview {
    Profile()
}
