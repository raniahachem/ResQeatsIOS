//
//  Screen2.swift
//  resQeats
//
//  Created by KOOLI MOOTEZ on 08/11/2023.
//

import SwiftUI

struct Screen2: View {
    var body: some View {
        ZStack{
            (Color.gray).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea(.all)
            Image("istockphoto-920931456-1024x1024")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
                .frame(width: 10,height: 300)
                .offset(x:0,y:-92)
            
          
               
                
                

            Label("Discover savor delicious plates", systemImage: "")
                .padding([.top, .leading], 0.0)
                .frame(height: 0.0)
                .bold()
                .font(.title3)
                
            
             
            Label("Explore a world of flavor with affordable surplus meals", systemImage: "")
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
