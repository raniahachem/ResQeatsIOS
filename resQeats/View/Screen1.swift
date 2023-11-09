//
//  Screen1.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 07/11/2023.
//

import SwiftUI

struct Screen1: View {
    var body: some View {
        ZStack{
            (Color.gray).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            Image("images")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                .frame(width: 10,height: 300)
                .offset(x:0,y:-92)
            
          
               
                
                

            Label("Welcome to resQeats", systemImage: "")
                .padding([.top, .leading], 0.0)
                .frame(height: 0.0)
                .bold()
                .font(.title3)
                
            Label("From Waste to Taste", systemImage: "")
                .padding(.top, 100.0)
                .font(.system(size: 11))
             
            Label("Rescue,savor,and save with budget-friendly surplus meals", systemImage: "")
                .frame(width: 300.0, height: 2.0)
                .accessibilityElement(children: /*@START_MENU_TOKEN@*/.contain/*@END_MENU_TOKEN@*/)
                .padding(.top, 180.0)
                .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
                .font(.system(size: 9))
            Button("Next") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            .padding(.top, 290.0)
            .contrast(17)
            .buttonStyle(.borderedProminent)

        }
    }
}

#Preview {
    Screen1()
}