//
//  sugnUp2.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI

struct sugnUp2: View {
    @State private var name = ""
    @State private var email = ""
    @State private var chooseType = ""
    @State private var Password = ""
    @State private var ConfirmPassword = ""

    var body: some View {
       
        VStack(alignment: .leading,spacing: 15, content: {
            
            Text("Signup")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .offset(x:105, y:-140)
            
            Text("Add your details to sign up as a recepient")
                .font(.callout)
                .fontWeight(.regular)
                .foregroundStyle(.gray)
                .padding(.top,-5)
                .offset(x:3 , y:-145)
                .opacity(0.3)
                .font(.system(size: 0.1))
            
            
        })
        VStack{
            TextField("Name" , text: $name)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-120)
            
        }
     
        VStack{
            TextField("Email" , text: $email)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-100)
            
        }
        
        VStack{
            TextField("password" , text: $Password)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-80)
            
        }
        
    
        
        VStack{
            TextField("conformPassword" , text: $ConfirmPassword)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-60)
            
        }
        
        VStack{
            TextField("chooseType" , text: $chooseType)
            
                .padding()
                .frame(width: 300 , height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .offset(x:-3 ,y:-45)
            
        }
        VStack{
            Button("Signup"){
                
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
                .font(.system(size:13))
        }
        VStack{
            Text("By Creating an account you agree to our ")
            Text("Terms of services and Privacy polices")
            
        }   .opacity(0.19)
            .font(.system(size: 15))
            .offset(x:5,y:27)
        
        VStack{
            Button("Login"){
                
            }
            .foregroundColor(.red)
            .frame(width: 55 , height: 19)
            .background(Color.white)
            .cornerRadius(10)
            .offset(x:110 , y:37)
            .font(.system(size: 12))
            
            
            
        }
        //butoon back image manque
    
        

    }
}


#Preview {
    sugnUp2()
}
