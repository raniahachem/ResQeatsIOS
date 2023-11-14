//
//  NewPassword.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI


struct NewPassword: View {
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
                    .offset(x:-5, y:-354)
                
                VStack{
                    Spacer(minLength: 20)
                    
                    Label("Create a new Password ", systemImage:"")
                        .padding()
                        .frame(width: 300 , height: 50)
                        .background(Color.black.opacity(0))
                        .frame(width: 1200 , height: 150)
                        .cornerRadius(10)
                        .offset(x:-1 , y:-620)
                        .opacity(0.35)
                        .font(.system(size: 10))
                    
                }
                VStack{
                    TextField("New Password" , text: $password)
                    
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
                    TextField("confirm Password" , text: $confirmPassword)
                    
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
    NewPassword()
}
