//
//  signup.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 09/11/2023.
//

import SwiftUI

struct signup: View {
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle()
                   
                // boutton back
                    .scale(1.9)
                    .foregroundColor(.green.opacity(0.29))
                Color.white.ignoresSafeArea()
                
                Label("Sign Up", systemImage: "")
                    .padding()
                    .frame(width: 300 , height: 50)
                    .background(Color.black.opacity(0))
                    .cornerRadius(10)
                    .offset(x:-8, y:-330)
                
                Spacer(minLength: 22)
                
                VStack{
                    Button("As a Food Supplier"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .offset(x:3 , y:-255)
        
  
                }
                Spacer()
                Spacer()
                VStack{
                    Button("As a recepient" ){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300 , height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    .offset(x:3 , y:-161)
        
  
                }
                
                
            }
        }
    }
}

#Preview {
    signup()
}
