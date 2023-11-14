//
//  Screen3.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI

struct Screen3: View {
    var body: some View {
        ZStack{
            (Color.white).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            VStack{
                Image("image45")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                    .frame(width: 255,height: 520)
                    .offset(x:117.5,y:139)
            }
             

            
          
            
            VStack{
                Label("Make difference", systemImage: "")
                    .padding([.top, .leading], 0.0)
                    .frame(height: 44.0)
                    .bold()
                    .font(.title3)
                    .offset(x: -5, y:189)
            }
            VStack{
                
                Label("Be part of the mouvement to help fight hunger worldwide", systemImage: "")
                    .frame(width: 300.0, height: 2.0)
                    .accessibilityElement(children: .contain)
                    .padding(.top, 180.0)
                    .accessibilityLabel("Label")
                    .font(.system(size: 9))
                    .offset(x: 5, y: 135)
            }
            
            VStack{
                
                Button("Next"){
                    
                }
                .foregroundColor(.red)
                .frame(width: 255 , height: 55)
                .background(Color.green)
                .cornerRadius(10)
                .offset(x:95 , y:77)
                .font(.system(size: 19))
                .offset(x:-90 , y:225)
            }

            
        }
    }
}

#Preview {
    Screen3()
}
