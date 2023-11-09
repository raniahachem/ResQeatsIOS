//
//  ResetPassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI

struct ResetPassword: View {
    @State private var email = ""
    
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
                    Button("send"){
                        
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

#Preview {
    ResetPassword()
}
